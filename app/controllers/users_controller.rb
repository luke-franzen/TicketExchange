class UsersController < ApplicationController
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    def create
        @user = User.new(user_params)
        if @user.save
            flash[:notice] = "Sign up successful."
            redirect_to welcome_path
        else
            render 'new'
        end
    end
end
