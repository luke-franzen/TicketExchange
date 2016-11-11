class User < ActiveRecord::Base
    has_many :tickets
    has_many :games, :through => :tickets
    has_many :conversations, :foreign_key => :sender_id
    

    has_secure_password
    before_save {|user| user.email=user.email.downcase}
    before_save :create_session_token
    before_save {|user| user.email=user.email.downcase}
    validates :first_name, presence: true, length: { maximum: 50 }
    validates :last_name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: {case_sensitive: false}, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
    validates :password, length: { minimum: 6 }

    private
    def create_session_token
        self.session_token = SecureRandom.urlsafe_base64
    end
end