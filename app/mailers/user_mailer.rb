class UserMailer < ActionMailer::Base

  default from: 'notifications@avifoxitestthis.com'

  def email(sender, content)
    mail(to: sender,
         subject: 'Your Analyses From... Should I Send This?',
         body: content)
  end
end
