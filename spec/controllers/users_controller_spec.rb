require 'rails_helper'
require 'spec_helper'

describe UsersController do
    describe 'Signing Up' do
        it 'should show the sign up page' do
            expect(User).to receive(:new)
            post :new
        end
        it 'should call the model method that performs saves the user' do
            expect_any_instance_of(User).to receive(:save)
            post :create, {:user => {first_name: "John", last_name: "Smith", email: "johnsmith@email.com", password: "123456", password_confirmation: "123456" }}
        end
        it 'should flash a message saying successful sign up' do
            post :create, {:user => {first_name: "John", last_name: "Smith", email: "johnsmith@email.com", password: "123456", password_confirmation: "123456" }}
            expect(flash[:notice]).to match(/successful/)
        end
        it 'should redirect to the welcome page' do
            post :create, {:user => {first_name: "John", last_name: "Smith", email: "johnsmith@email.com", password: "123456", password_confirmation: "123456" }}
            expect(response).to redirect_to(welcome_index_path)
        end
    end
end