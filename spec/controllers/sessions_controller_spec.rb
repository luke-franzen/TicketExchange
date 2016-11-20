require 'rails_helper'
require 'spec_helper'

describe SessionsController do
    describe 'Logging In' do
        it 'should find the user based on email' do
            session = {:session => {email: "some_email@email.com", password: "dont_crack_my_password"}}
            expect(User).to receive(:find_by_email).with(session[:session][:email])
            post :create, session
        end
        it 'should not log in for bad credentials' do
            session = {:session => {email: "some_email@email.com", password: "dont_crack_my_password"}}
            expect(User).to receive(:find_by_email).and_return(nil)
            post :create, session
            expect(flash[:notice]).to match(/Invalid/)
        end
        it 'should not log in for good credentials and not activated' do
            session = {:session => {email: "some_email@email.com", password: "dont_crack_my_password"}}
            expect(User).to receive(:find_by_email).and_return(User.new)
            expect_any_instance_of(User).to receive(:authenticate).and_return(true)
            expect_any_instance_of(User).to receive(:activated?).and_return(false)
            post :create, session
            expect(flash[:notice]).to match(/not activated/)
            expect(response).to redirect_to(root_url)
        end
        it 'should log in for good credentials and activated' do
            session = {:session => {email: "some_email@email.com", password: "dont_crack_my_password"}}
            expect(User).to receive(:find_by_email).and_return(User.new)
            expect_any_instance_of(User).to receive(:authenticate).and_return(true)
            expect_any_instance_of(User).to receive(:first_name).and_return("Bob")
            expect_any_instance_of(User).to receive(:last_name).and_return("McDonald")
            expect_any_instance_of(User).to receive(:activated?).and_return(true)
            post :create, session
            expect(flash[:notice]).to match(/Welcome/)
            expect(response).to redirect_to(welcome_index_path)
        end
    end

    describe 'Logging Out' do
        it 'should log out the user' do
            expect(cookies).to receive(:delete)
            post :destroy
            expect(flash[:notice]).to match(/logged out/)
            expect(response).to redirect_to(welcome_index_path)
        end
    end
end
