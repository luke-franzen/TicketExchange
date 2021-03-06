class UsersController < ApplicationController
    before_filter :set_current_user, :only=> ['show', 'edit', 'update', 'delete']

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            @user.send_activation_email
            flash[:notice] = "Sign up successful. A verification email has been sent."
            redirect_to welcome_index_path
        else
            render 'new'
        end
    end
    
     def show
        id = params[:id] # retrieve movie ID from URI route
        @user = User.find(id) # look up movie by unique ID
        @tickets = @user.tickets.select{|t|!t.sold}
        @tickets.sort_by{|t| t.created_at}
        @tickets.reverse! #guarantee most recent at top
        if @user == @current_user
            @sold = @user.tickets.select{|t|t.sold}
            @sold.sort_by{|t| t.updated_at}
            @sold.reverse!
        end
    end

    private
        def user_params
            params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
        end
end
