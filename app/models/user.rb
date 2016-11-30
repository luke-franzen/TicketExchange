class User < ActiveRecord::Base
    has_many :tickets, :dependent => :destroy
    has_many :games, :through => :tickets
    has_many :conversations, :foreign_key => :sender_id

    attr_accessor :activation_token, :reset_token

    has_secure_password
    before_create :create_activation_digest
    before_save {|user| user.email=user.email.downcase}
    before_save :create_session_token
    validates :first_name, presence: true, length: { maximum: 50 }
    validates :last_name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: {case_sensitive: false}, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
    validates :password, length: { minimum: 6 }

    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    def authenticated?(attribute, token)
        digest = send("#{attribute}_digest")
        return false if digest.nil?
        BCrypt::Password.new(digest).is_password?(token)
    end

    # Activates an account.
    def activate
        update_attribute(:activated,    true)
        update_attribute(:activated_at, Time.zone.now)
    end

    # Sends activation email.
    def send_activation_email
        UserMailer.account_activation(self).deliver_now
    end

    def send_password_reset_email
        UserMailer.password_reset(self).deliver_now
    end

    def create_reset_digest
        self.reset_token = SecureRandom.urlsafe_base64
        update_attribute(:reset_digest, User.digest(reset_token))
        update_attribute(:reset_sent_at, Time.zone.now)
    end

    def password_reset_expired?
        reset_sent_at < 2.hours.ago
    end

    private
        def create_session_token
            self.session_token = SecureRandom.urlsafe_base64
        end
        def create_activation_digest
            self.activation_token = SecureRandom.urlsafe_base64
            self.activation_digest = User.digest(activation_token)
        end
end