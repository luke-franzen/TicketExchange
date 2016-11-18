require 'rails_helper'
require 'spec_helper'

RSpec.describe ApplicationController do
  describe "getting current user" do
    it "it should check the current user id" do
        current_user = double({id: 1, first_name: "jack", last_name: "sparrow", email: "jack_sparrow@gmail.com", password_digest: "$2a$10$f3ZnpMw8uLR3QT.tkaspKeFU9sWpf70Z4e80zk446im...", rating: nil, session_token: "mrwdPDZ-Lpv_I0Zjlh4qlg", created_at: "2016-11-14 18:39:49", updated_at: "2016-11-14 18:39:49"})
        controller.instance_variable_set(:@current_user, current_user)
        controller.view_context.current_user?(1)
    end
  end
end