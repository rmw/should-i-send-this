# require 'twilio-ruby'

class TwilioController < ApplicationController
  include Webhookable

  after_filter :set_header

  skip_before_action :verify_authenticity_token

  def voice
    response = Twilio::TwiML::Response.new do |r|
      r.Say 'Hey there. Congrats on integrating Twilio into your Rails 4 app.', :voice => 'alice'
         r.Play 'http://linode.rabasa.com/cantina.mp3'
    end

    render_twiml response
  end


  def sms
    message_content = params[:Body]
    message_number = params[:From]

    alchemist = AlchemyData.new(message_content)

    if alchemist
      response_body = compile_response(alchemist)
    else
      response_body = "Should I Send This is currently under maintenance."
    end



    # put your own credentials here
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]

    # set up a client to talk to the Twilio REST API
    client = Twilio::REST::Client.new(account_sid, auth_token)

    client.account.messages.create({
      :from => '+16172084459',
      :to => message_number,
      :body => response_body,
    })
  end

  private

  def compile_response(alchemist)
    keywords = alchemist.keywords.take(3)
    response_body = ''

    response_body << "Your top concept is: #{alchemist.concepts.first}. "

    response_body << "Your top 3 keywords are: " + keywords.join(", ") + ". "

    case alchemist.sentiment
    when -1..0
      response_body << "Are you intending to send a negative message? If so send away! \uU+1F44E"
    when 0..1
      response_body << "Looks good to me. Send away! \uU+1F44C"
    else
      response_body << "Should I Send This is currently under maintenance."
    end
  end
end

# Avi's twilio number gen'd by the api
# (929) 244-4620
#






