class RatingsController < ApplicationController
    before_filter :set_current_user

    # handles both creating a rating and updating one
    def update_rating
        @rating = params[:value]
        @rated_user = params[:rated_user]
        @previous_rating = Rating.find_by rated_user_id: @rated_user, rating_user_id: @current_user.id
        if @previous_rating.blank?
            Rating.create(rated_user_id: @rated_user, rating_user_id: @current_user.id, value: @rating)
        else
            @previous_rating.value = @rating
            @previous_rating.save
        end
        render nothing: true, status: :ok and return
    end
end
