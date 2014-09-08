class EmailController < ApplicationController

  def create
    @params = params
    UserMailer.test_email(@params).deliver
    redirect_to root_url
  end
end
