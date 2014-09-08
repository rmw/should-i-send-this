class UserMailer < ActionMailer::Base

  default from: 'notifications@avifoxitestthis.com'

  def email(sender, content)
    alchemist = AlchemyData.new(content)

    if alchemist
      sentiment = alchemist.sentiment
    else
      sentiment = "Should I Send This?... is down for maintenance. Try again later!"
    end

    sentiment = "This should work!"


    # case alchemist.sentiment
    # when -1..0
    #   response_body << "Are you intending to send a negative message? If so send away!"
    # when 0..1
    #   response_body << "Looks good to me. Send away!"
    # else
    #   response_body << "Should I Send This is currently under maintenance."
    # end

    # content = content
    # @url  = 'http://example.com/login'
    # @params = params
    mail(to: sender,
         subject: 'Your Analyses From... Should I Send This?',
         body: sentiment)
  end
end
