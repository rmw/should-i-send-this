# Copyright ©2012 by James K. Lawless
# See full MIT / X11 license at
# http://www.mailsend-online.com/license2012.php

# Mark all emails in my Gmail inbox as read.

require 'gmail'
require 'mail'

class FakeAlchemist
  attr_reader :keywords, :concepts, :sentiment

  def initialize
    @keywords = ["hot dogs", "salty", "buns", "mention", "thoughts", "MIND", "buns."]
    @concepts = ["2000 albums"]
    @sentiment = -0.393271
  end

end

username = 'shouldisendthis@gmail.com'
password = '4four@dbc'

gmail = Gmail.new(username, password)

Mail.defaults do
  delivery_method :smtp, { :address              => "smtp.gmail.com",
                           :port                 => 587,
                           :domain               => 'gmail.com',
                           :user_name            => 'shouldisendthis',
                           :password             => '4four@dbc',
                           :authentication       => 'plain',
                           :enable_starttls_auto => true  }
end

gmail.inbox.emails(:unread).each do |msg|
  msg.mark(:read)
  if msg.subject == "[SIST]"
    alchemist = FakeAlchemist.new

    keywords = alchemist.keywords.join(",")
    concepts = alchemist.concepts.join(",")
    sentiment = alchemist.sentiment

    sender = msg.from[0]
    email_body = "#{msg.body}"

    mail = Mail.new do
      from     'shouldisendthis.@gmail.com'
      to       sender
      subject  '[SIST] Here are your results.'

      html_part do
        content_type 'text/html; charset=UTF-8'
        body "<p>#{email_body}</p>" +
             "<p>Your keywords are #{keywords}.</p>" +
             "<p>Your concept is #{concepts}.</p>" +
             "<p>Your sentiment score is #{sentiment}.</p>"
      end
    end
  end
  mail.deliver!
end
