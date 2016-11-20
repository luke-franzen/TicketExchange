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

    private
        def user_params
            params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
        end
end
