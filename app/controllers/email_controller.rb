class EmailController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only => [:create]

  def create
    sender = EmailParser.sender(params)

    content = "Hello and thank you for using Should I Send This???  Below you will find the content of your email."
    content << "\n\n\n"
    content << EmailParser.content(params)

    # alchemist = AlchemyData.new(content)

    # if alchemist
    #   sentiment = alchemist.sentiment
    # else
    #   sentiment = "Should I Send This? ...is down for maintenance. Try again later!"
    # end

    UserMailer.email(sender, content).deliver
  end
end


