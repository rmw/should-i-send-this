require 'rails_helper'

RSpec.describe EmailController, :type => :controller do
  describe "POST email" do
    it "posts to email_process route and sends email" do
      post :create, { :params => {:stuff => 'testing'}}
    end
  end

end
