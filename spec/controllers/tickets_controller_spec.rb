require 'spec_helper'
require 'rails_helper'

describe TicketsController do
    describe 'Posting a ticket' do
        before{(@game=Game.new(id: 1, name: "Iowa State Cyclones", date: "10-Sep-2016"))
                (@current_user=User.new(id: 1, first_name: "John", last_name: "Smith", email: "jsmith@gmail.com", password_digest: "password",
                    rating: 5))
                #@ticket2=Ticket.new(game_id: @game.id, price: 40, ticket_type: "student")
                #@current_user.tickets << @ticket2
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
            #expect(Ticket).to receive(:new).with(game_id: @game.id, user_id: @current_user.id)
            #expect(@current_user.tickets).to eq(@ticket)
            #expect(flash[:notice]).to match("Your ticket was successfully posted.")
            #expect(response).to redirect_to(game_tickets_path(@ticket.game_id))
            #post :create, {:ticket => {game_id: @game.id, user_id: @current_user.id}}
        end
        
        it 'should flash a message and redirect if incorrect ticket' do
            post :create, {:ticket => {user_id: "the"}}
            expect(flash[:notice]).to match("Invalid ticket submission.") 
            expect(response).to redirect_to(new_ticket_path)
        end
    end
end