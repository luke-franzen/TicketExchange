class UsersController < ApplicationController
    before_filter :set_current_user, :only=> ['show', 'edit', 'update', 'delete']

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "Sign up successful."
            redirect_to welcome_index_path
        else
            render 'new'
        end
    end

    def show
        id = params[:id] # retrieve movie ID from URI route
        @user = User.find(id) # look up movie by unique ID
    end

    private
        def user_params
            params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
        end
end
