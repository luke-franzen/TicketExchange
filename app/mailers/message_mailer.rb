class MessageMailer < ApplicationMailer
    def new_message(user)
        @user = user
        puts "HERE"
        puts user.id
        mail to: user.email, subject: "New Message"
    end
end