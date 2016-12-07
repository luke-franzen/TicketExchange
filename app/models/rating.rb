class Rating < ActiveRecord::Base
    belongs_to :rating_user, class_name: "User", foreign_key: :rating_user_id
    belongs_to :rated_user, class_name: "User", foreign_key: :rated_user_id
end
