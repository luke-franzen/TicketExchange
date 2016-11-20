require 'rails_helper'

RSpec.describe AccountActivationsController, type: :controller do
    describe 'activating account' do
        it 'should fail to activate for already activated user' do
            user = double(User)
            expect(User).to receive(:find_by).and_return(user)
            expect(user).to receive(:activated?).and_return(true)
            get :edit, :id => 1, :email => "email@email.com"
            expect(flash[:notice]).to match(/Invalid/)
            expect(response).to redirect_to(root_url)
        end

        it 'should succeed in activating a user with proper link' do
            user = double(User)
            expect(User).to receive(:find_by).and_return(user)
            expect(user).to receive(:activated?).and_return(false)
            expect(user).to receive(:authenticated?).and_return(true)
            expect(user).to receive(:activate)
            get :edit, :id => 1, :email => "email@email.com"
            expect(flash[:notice]).to match(/Account activated/)
            expect(response).to redirect_to(root_url)
        end
    end
end
