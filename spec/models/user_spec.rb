require 'rails_helper'
require 'spec_helper'

describe User do
    describe 'password reset expired' do
        it 'should return true if expired' do
            user = User.new
            user.reset_sent_at = 3.hours.ago
            expect(user.password_reset_expired?).to be_truthy
        end

        it 'should return false if not expired' do
            user = User.new
            user.reset_sent_at = 1.hour.ago
            expect(user.password_reset_expired?).to be_falsy
        end
    end

    describe 'sending password reset email' do
        it 'should send the password reset email' do
            user = User.new
            mail = double(Mail)
            expect(UserMailer).to receive(:password_reset).with(user).and_return(mail)
            expect(mail).to receive(:deliver_now)
            user.send_password_reset_email
        end
    end

    describe 'modifying user' do
        it 'should create the digest' do
            user = User.new
            user.email = "email@email.com"
            old_time = Time.zone.now
            user.create_reset_digest
            expect(user.reset_token).not_to be_nil
            expect(user.reset_sent_at).to be >= old_time
        end

        it 'should activate the user' do
            user = User.new
            user.email = "email@email.com"
            user.activated = false
            old_time = Time.zone.now
            user.activate
            expect(user.activated).to be_truthy
            expect(user.activated_at).to be >= old_time
        end
    end

    describe 'check user authenticated' do
        it 'should be false if not authenticated' do
            user = User.new
            user.reset_digest = nil
            expect(user.authenticated?(:reset, 3)).to be_falsy
        end

        it 'should be truthy if authenticated' do
            user = User.new
            user.activation_token = SecureRandom.urlsafe_base64
            user.activation_digest = User.digest(user.activation_token)
            expect(user.authenticated?(:activation, user.activation_token)).to be_truthy
        end
    end
end