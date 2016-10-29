class TicketsController < ApplicationController
    def index
        @game = Game.find_by_id(params[:game_id])
        @tickets = @game.tickets
    end
end