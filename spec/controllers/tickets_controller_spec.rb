require 'spec_helper'
require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
    
    before(:each) do
        @game = Game.new({:id => 1, :name => "Iowa State Cyclones", :date => "10-Sep-2016"})
        @current_user = User.new({ :id => 1, :first_name => "John", :last_name => "Smith", :email => "jsmith@gmail.com"})
        @ticket = Ticket.new({:id => 1, :user_id => 1, :game_id => 1, :price => 40, :sold => true, :ticket_type => "student"})
        allow(Game).to receive(:find_by_id).with("1").and_return(@game)
        allow(Ticket).to receive(:find_by_id).with("1").and_return(@ticket)
        controller.instance_variable_set(:@current_user, @current_user)
    end
        
    describe 'Posting a ticket' do
        it 'should show the tickets page' do
            expect(Ticket).to receive(:new)
            get :new
        end
        
        it 'should query the games database and return a game object when a game is selected for a ticket' do
            expect(@game).to receive(:tickets).and_return(Ticket.all)
            expect(@game).to receive(:tickets).and_return(Ticket.all)
            get :index, {:game_id => "1"}
        end
        
        it 'should allow you to edit a ticket after posting' do
            expect(Ticket).to receive(:find_by_id).with("1").and_return(@ticket)
            allow(@ticket).to receive(:sold).and_return(true)
            allow(@ticket).to receive(:save).and_return(true)
            get :edit, {:game_id => "1", :id => "1"}
            expect(response).to redirect_to(user_path(:id => @current_user.id))
        end
        
        it 'should allow you to delete a ticket after posting' do
            allow(Ticket).to receive(:find).with("1").and_return(@ticket)
            allow(@ticket).to receive(:destroy)
            delete :destroy, {:game_id => "1", :id => "1"}
            expect(flash[:notice]).to eq "Ticket successfully deleted."
            expect(response).to redirect_to(user_path(:id => @current_user.id))
        end
        
        it 'should flash a message saying successful ticket' do
            expect(Ticket).to receive(:new).with({:game_id => "1", :user_id => "1"}).and_return(@ticket)
            allow(@ticket).to receive(:save).and_return(true)
            post :create, {:ticket => {:game_id => "1", :user_id => "1"}}
            expect(flash[:notice]).to eq "Your ticket was successfully posted."
            expect(response).to redirect_to(game_tickets_path(@ticket.game_id))
        end
        
        it 'should flash a message and redirect if incorrect ticket' do
            post :create, {:ticket => {user_id: "the"}}
            expect(flash[:notice]).to match("Invalid ticket submission.") 
            expect(response).to redirect_to(new_ticket_path)
        end
    end
end