class TicketsController < ApplicationController
    before_filter :set_current_user
    
    def index
        @game = Game.find_by_id(params[:game_id])
        @tickets = @game.tickets
    end
    
    def new
        @ticket = Ticket.new
    end
    
    def create
        @ticket = Ticket.new(ticket_params)
        if @ticket.save
            @current_user.tickets << @ticket
            flash[:notice] = "#{Game.find_by_id(@ticket.game_id).name} ticket was successfully posted."
            redirect_to game_tickets_path(@ticket.game_id)
        else
            flash[:notice] = "Invalid ticket submission."
            redirect_to new_ticket_path
        end
    end
        
    private
        def ticket_params
            params.require(:ticket).permit(:game_id, :ticket_type, :price, :user_id)
        end
end