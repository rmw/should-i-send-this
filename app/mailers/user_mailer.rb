class UserMailer < ActionMailer::Base
  # default from: "from@example.com"

  default from: 'notifications@avifoxitestthis.com'

  def test_email
    @user = User.find(17)
    @url  = 'http://example.com/login'
    mail(to: 'frosenox@gmail.com', subject: 'redirecting from mail gun to ActionMailer via heroku')
  end
end
