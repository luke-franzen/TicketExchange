class TicketsController < ApplicationController
    before_filter :set_current_user
    
    def index
        @game = Game.find_by_id(params[:game_id])
        @tickets = @game.tickets.select{|t|!t.sold}
        @soldTickets = @game.tickets.select{|t|t.sold}
    end
    
    def new
        @ticket = Ticket.new
    end
    
    def edit
        @ticket = Ticket.find_by_id(params[:id])
        @ticket.sold = true;
        @ticket.save!
        redirect_to user_path(@current_user)
    end
    
    def destroy
        @ticket = Ticket.find(params[:id])
        @ticket.destroy
        flash[:notice] = "Ticket successfully deleted."
        redirect_to user_path(@current_user) 
    end
    
    def create
        @ticket = Ticket.new(ticket_params)
        if @ticket.save
            @current_user.tickets << @ticket
            flash[:notice] = "Your ticket was successfully posted." #"Your #{Game.find_by_id(@ticket.game_id).name} ticket was successfully posted."
            redirect_to game_tickets_path(@ticket.game_id)
        else
            flash[:notice] = "Invalid ticket submission."
            redirect_to new_ticket_path
        end
    end
        
    private
        def ticket_params
            params.require(:ticket).permit(:game_id, :ticket_type, :section, 
                    :row, :seat, :price, :user_id, :sender_id, :recipient_id)
        end
end