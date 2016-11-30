class GamesController < ApplicationController
    before_filter :set_current_user
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
    
    def new
        @game = Game.new
    end
    
    def create
        @game = Game.new(game_params)
        if @game.save
            flash[:notice] = @game.name+" successfully added."
            redirect_to welcome_index_path
        else
            flash[:notice] = "Invalid input parameters."
            redirect_to new_game_path
        end
        
    end
    
    private
        def game_params
            params.require(:game).permit(:name,:date)
        end
end