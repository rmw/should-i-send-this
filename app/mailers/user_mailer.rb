class UserMailer < ActionMailer::Base
  # default from: "from@example.com"

  default from: 'notifications@avifoxitestthis.com'

  def test_email(params)
    @url  = 'http://example.com/login'
    @params = params
    mail(to: 'frosenox@gmail.com', subject: 'redirecting from mail gun to ActionMailer via heroku')
    p '##############'
    p 'EMAIL WORKED ???'
    p '##############'
  end
end
