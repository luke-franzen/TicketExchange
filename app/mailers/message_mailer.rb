class MessageMailer < ApplicationMailer
    def new_message(user)
        @user = user
        mail to: user.email, subject: "New Message"
    end
end