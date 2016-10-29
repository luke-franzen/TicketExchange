class TicketsController < ApplicationController
    def index
        @game = Game.find_by_id(params[:game_id])
        @tickets = @game.tickets
        @tickets.each do |ticket|
            user = User.find_by_id(ticket.user_id)
            puts(user.first_name)
        end
    end
end