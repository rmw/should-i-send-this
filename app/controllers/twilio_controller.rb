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
    sentiment = alchemist.sentiment


    # put your own credentials here 
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]
 
    # set up a client to talk to the Twilio REST API 
    @client = Twilio::REST::Client.new(account_sid, auth_token)
 
    @client.account.messages.create({
      :from => '+16172084459', 
      :to => message_number, 
      :body => "Your sentiment is #{sentiment}",  
    })
  end
end








