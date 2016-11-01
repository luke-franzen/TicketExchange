class Ticket < ActiveRecord::Base
   belongs_to :user
   belongs_to :game
   
   def self.all_types
    ["Student", "General Public", "UI Faculty and Staff", "UI Student Guest"]
  end
end