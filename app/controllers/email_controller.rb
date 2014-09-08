class EmailController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only => [:create]

  def create
    # sender = EmailParser.sender(params)
    sender="awc583@gmail.com"

    # content = EmailParser.content(params)
    content = "Hello There!!!"

    UserMailer.test_email(sender, content).deliver
    # redirect_to root_url
  end
end
