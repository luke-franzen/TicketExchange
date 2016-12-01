class Ticket < ActiveRecord::Base
   belongs_to :user
   belongs_to :game

   validates :price, presence:true, numericality: { greater_than: 0 }, 
             :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }
   
   def self.all_types
    ["Student", "General Public", "UI Faculty and Staff", "UI Student Guest"]
  end
end