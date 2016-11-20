require 'rails_helper'
require 'spec_helper'

describe UsersController do
     before(:each) do
        @current_user = User.new({ :id => 1, :first_name => "John", :last_name => "Smith", :email => "jsmith@gmail.com"})
        @ticket = Ticket.new({:id => 1, :user_id => 1, :game_id => 1, :price => 40, :sold => true, :ticket_type => "student"})
        allow(Ticket).to receive(:find_by_id).with("1").and_return(@ticket)
        controller.instance_variable_set(:@current_user, @current_user)
    end

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
        it 'should show users profile page' do
            allow(User).to receive(:find).with("1").and_return(@current_user)
            get :show, {:id => "1"}
        end
    end
end