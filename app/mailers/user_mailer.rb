class UserMailer < ActionMailer::Base
  # default from: "from@example.com"

  default from: 'notifications@avifoxitestthis.com'

  def test_email(sender, content)
    @alchemist = AlchemyData.new(content).retrieve_from_api
    @content
    @url  = 'http://example.com/login'
    @params = params
    mail(to: sender, subject: 'redirecting from mail gun to ActionMailer via heroku')
    p '##############'
    p 'EMAIL WORKED ???'
    p '##############'
  end
end
