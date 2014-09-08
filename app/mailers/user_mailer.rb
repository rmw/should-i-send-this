class UserMailer < ActionMailer::Base
  # default from: "from@example.com"

  default from: 'notifications@avifoxitestthis.com'

  def email(sender, content)
    # @alchemist = AlchemyData.new(content).retrieve_from_api
    # content = content
    # @url  = 'http://example.com/login'
    # @params = params
    mail(to: sender,
         subject: 'Your Analyses From... Should I Send This?',
         body: content)
  end
end
