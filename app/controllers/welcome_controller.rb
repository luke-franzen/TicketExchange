class WelcomeController < ApplicationController
before_filter :set_current_user

autocomplete :game, :name

  def index
    @games = Game.all
  end

  def search_game
    if(params[:search_game].nil? || params[:search_game].empty?)
      flash[:notice] = "Invalid search term"
      redirect_to welcome_index_path
    else
      @game=Game.find_by_name(params[:search_game])
      if(@game.nil?)
        flash[:notice] = "No matching games. Please select a game"
        redirect_to welcome_index_path
      else
        redirect_to game_tickets_path(@game.id())
      end
    end
  end


end
