class GamesController < ApplicationController
    autocomplete :game, :name, :full => true
    
    def destroy
        game = Game.find_by_id(params[:id])
        game.tickets.each do |ticket|
            ticket.delete
        end
        game.destroy    
        flash[:notice] = game.name+" successfully deleted."
        redirect_to welcome_index_path
    end
    
    private
        def game_params
        params.require(:id)
        end
end