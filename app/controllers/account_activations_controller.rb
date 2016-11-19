class AccountActivationsController < ApplicationController
    def edit
        user = User.find_by(email: params[:email])
        if user && !user.activated? && user.authenticated?(:activation, params[:id])
            user.activate
            flash[:notice] = "Account activated!"
            redirect_to root_url
        else
            flash[:notice] = "Invalid activation link"
            redirect_to root_url
        end
    end
end
