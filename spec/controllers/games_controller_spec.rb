require 'spec_helper'
require 'rails_helper'

RSpec.describe GamesController, type: :controller do
    
    before(:each) do
        @game = Game.new({:id => 1, :name => "Iowa State Cyclones", :date => "10-Sep-2016"})
        @ticket = Ticket.new({:id => 1, :user_id => 1, :game_id => 1, :price => 40, :sold => true, :ticket_type => "student"})
        allow(Game).to receive(:find_by_id).with("1").and_return(@game)
        allow(Ticket).to receive(:find_by_id).with("1").and_return(@ticket)
        allow(@ticket).to receive(:delete)
    end

    describe 'Games controller should' do
        it 'should create new game correctly' do
            expect(Game).to receive(:new)
            get :new
        end
        
        it 'successfully delete a game' do
            expect(Game).to receive(:find_by_id).with("1").and_return(@game)
            expect(@game).to receive(:tickets).and_return(Ticket.all)
            allow(Ticket.all).to receive(:each).and_return(@ticket)
            allow(Ticket.all).to receive(:delete)
            expect(@game).to receive(:destroy)
            delete :destroy, {:id => "1"}
            expect(flash[:notice]).to eq "Iowa State Cyclones successfully deleted."
            expect(response).to redirect_to(welcome_index_path)
        end
        
        it 'successfully create a game' do
            allow(Game).to receive(:new).and_return(@game)
            expect(@game).to receive(:save).and_return(true)
            post :create, {:game => {:name => "Iowa State", :date => "22-Nov-2016"}}
            expect(flash[:notice]).to eq "Iowa State Cyclones successfully added."
            expect(response).to redirect_to(welcome_index_path)
        end
        
        it 'should successfully guard against invalid game params' do
            allow(Game).to receive(:new).and_return(@game)
            expect(@game).to receive(:save).and_return(false)
            post :create, {:game => {:date => "22-Nov-2016"}}
            expect(flash[:notice]).to eq "Invalid input parameters."
            expect(response).to redirect_to(new_game_path)
        end
    end
end