# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class MessageMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/account_activation
  def new_message
    MessageMailer.new_message
  end
end
