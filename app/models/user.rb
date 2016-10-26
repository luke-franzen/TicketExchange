class User < ActiveRecord::Base
    has_many :tickets
    has_many :games, :through => :tickets
end