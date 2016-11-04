require 'spec_helper'
require 'rails_helper'

describe TicketsController do
    describe 'Posting a ticket' do
        before{(@game=Game.new(name: "Iowa State Cyclones", date: "10-Sep-2016"))
                (@current_user=User.new(first_name: "John", last_name: "Smith", email: "jsmith@gmail.com", password_digest: "password",
                    rating: 5))
                @ticket=Ticket.new(user_id: @current_user.id, game_id: @game.id, price: 40, ticket_type: "student")
        }
        
        it 'should show the tickets page' do
            expect(Ticket).to receive(:new)
            get :new
        end
        
        it 'should query the games database and return a game object when a game is selected for a ticket' do
            expect(Game).to receive(:find_by_id).with('2').and_return(@game)
            get :index, {:game_id => "2"}
        end
        
        it 'should flash a message saying successful ticket' do
            post :create, {:ticket => {user_id: @current_user.id, game_id: @game.id, price: 40, ticket_type: "student"}}
            expect(flash[:notice]).to match("Your ticket was successfully posted.")
        end
    end
end