class EmailController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only => [:create]

  def create
    sender = EmailParser.sender(params)
    content = EmailParser.content(params)
    UserMailer.test_email(sender, content)
    redirect_to root_url
  end
end
