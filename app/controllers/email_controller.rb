class EmailController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only => [:create]

  def create
    @params = params
    UserMailer.test_email(@params).deliver
    redirect_to root_url
  end
end
