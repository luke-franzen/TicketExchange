require 'spec_helper'
require 'rails_helper'

describe WelcomeController do
    describe 'Should render the index page and render the games' do
        it 'should render the index route' do
            post :index, {}
            allow(Game).to receive(:all).and_return('Iowa State Cyclones')
        end
    end
    
    describe 'Should search games' do
        it 'should flash an error if the game is not found' do
            post :search_game, {"search_game" => "asdhfjalks"}
            expect(flash[:notice]).to eq("No matching games. Please select a game")
            expect(subject).to redirect_to(welcome_index_path)
        end
        
        it 'should redirect to index if params are nil' do
            post :search_game, {"search_game" => ""}
            expect(flash[:notice]).to eq("Invalid search term")
            expect(subject).to redirect_to(welcome_index_path)
        end
        
        it 'should redirect to game page if game is found' do
            
            game = instance_double("Game",  :name => "Miami RedHawks", :id => 1)
            allow(Game).to receive(:find_by_name).with("Miami RedHawks").and_return(game)
            allow(game).to receive(:id).and_return(1)
            post :search_game, {"search_game" => "Miami RedHawks"}
           
            expect(response).to redirect_to(game_tickets_path(game.id))
        end
        
        
    end
end