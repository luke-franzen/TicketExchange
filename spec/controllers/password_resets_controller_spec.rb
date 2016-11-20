require 'rails_helper'
require 'spec_helper'

describe PasswordResetsController do
    describe 'Emailing password reset' do
        it 'should send an email reset' do
            user = User.new
            expect(User).to receive(:find_by).and_return(user)
            expect_any_instance_of(User).to receive(:create_reset_digest)
            expect_any_instance_of(User).to receive(:send_password_reset_email)
            post :create, {:password_reset => { :email => "test@test.com" } }
            expect(flash[:notice]).to match(/password reset instructions/)
            expect(response).to redirect_to(root_url)
        end

        it 'should not send an email for nonexistent user' do
            expect(User).to receive(:find_by).and_return(nil)
            post :create, {:password_reset => { :email => "test@test.com" }}
            expect(flash[:notice]).to match(/not found/)
            expect(response).to render_template(:new)
        end

    end

    describe 'updating password' do
        it 'redirects for invalid user' do
            user = User.new
            expect(User).to receive(:find_by).and_return(user)
            expect(user).to receive(:activated?).and_return(false)
            put :update, { id: 1, user: FactoryGirl.attributes_for(:user, :password => "pass", :password_confirmation => "pass") }
            expect(response).to redirect_to(root_url)
        end

        it 'redirects for expired password reset' do
            user = User.new
            expect(User).to receive(:find_by).and_return(user)
            expect(user).to receive(:activated?).and_return(true)
            expect(user).to receive(:authenticated?).and_return(true)
            expect(user).to receive(:password_reset_expired?).and_return(true)
            put :update, { id: 1, user: FactoryGirl.attributes_for(:user, :password => "pass", :password_confirmation => "pass") }
            expect(flash[:notice]).to match(/reset expired/)
            expect(response).to redirect_to(new_password_reset_url)
        end

        it 'shows error for empty password' do
            user = User.new
            errors = double("errors")
            expect(User).to receive(:find_by).and_return(user)
            expect(user).to receive(:password_reset_expired?).and_return(false)
            expect(user).to receive(:activated?).and_return(true)
            expect(user).to receive(:authenticated?).and_return(true)
            expect_any_instance_of(User).to receive(:errors).and_return(errors)
            expect(errors).to receive(:add).with(:password, "can't be empty")
            put :update, { id: 1, user: FactoryGirl.attributes_for(:user, :password => "", :password_confirmation => "") }
            expect(response).to render_template(:edit)
        end

        it 'should change the user password' do
            user = User.new
            expect(User).to receive(:find_by).and_return(user)
            expect(user).to receive(:password_reset_expired?).and_return(false)
            expect(user).to receive(:activated?).and_return(true)
            expect(user).to receive(:authenticated?).and_return(true)
            expect_any_instance_of(User).to receive(:update_attributes).and_return(true)
            put :update, { id: 1, user: FactoryGirl.attributes_for(:user, :password => "pass", :password_confirmation => "pass") }
            expect(flash[:notice]).to match(/Password has been reset/)
            expect(response).to redirect_to(root_url)
        end

        it 'should not update if error' do
            user = User.new
            expect(User).to receive(:find_by).and_return(user)
            expect(user).to receive(:password_reset_expired?).and_return(false)
            expect(user).to receive(:activated?).and_return(true)
            expect(user).to receive(:authenticated?).and_return(true)
            expect_any_instance_of(User).to receive(:update_attributes).and_return(false)
            put :update, { id: 1, user: FactoryGirl.attributes_for(:user, :password => "pass", :password_confirmation => "pass") }
            expect(response).to render_template(:edit)
        end
    end
end