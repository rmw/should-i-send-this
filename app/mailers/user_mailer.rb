class UserMailer < ActionMailer::Base
  # default from: "from@example.com"

  default from: 'notifications@avifoxitestthis.com'

  def test_email
    @user = User.find(17)
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
