require 'rails_helper'
require 'spec_helper'

RSpec.describe ApplicationController do
  before(:each) do
        @admins = ["luke.franzen@gmail.com"]
        @current_user = User.new({ :id => 1, :first_name => "John", :last_name => "Smith", :email => "jsmith@gmail.com"})
        controller.instance_variable_set(:@current_user, @current_user)
  end
  
  describe "application controller" do
    it "should check the current user id when getting current user" do
        current_user = double({id: 1, first_name: "jack", last_name: "sparrow", email: "jack_sparrow@gmail.com", password_digest: "$2a$10$f3ZnpMw8uLR3QT.tkaspKeFU9sWpf70Z4e80zk446im...", rating: nil, session_token: "mrwdPDZ-Lpv_I0Zjlh4qlg", created_at: "2016-11-14 18:39:49", updated_at: "2016-11-14 18:39:49"})
        controller.instance_variable_set(:@current_user, current_user)
        controller.view_context.current_user?(1)
    end
    
    it "should be able to check if current user is admin" do
      controller.view_context.currentuser_is_admin?
    end
  end
end