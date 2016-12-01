class MessageMailer < ApplicationMailer
    def new_message(user)
        @user = user
        puts user
        mail to: user.email, subject: "New Message"
    end
end