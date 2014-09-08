class EmailController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only => [:create]

  def create
    sender = EmailParser.sender(params)
    content = EmailParser.content(params)
    # content = "Whatever this is all about"

    # alchemist = AlchemyData.new(content)

    # if alchemist
    #   sentiment = alchemist.sentiment
    # else
    #   sentiment = "Should I Send This? ...is down for maintenance. Try again later!"
    # end

    UserMailer.email(sender, content).deliver
  end
end


