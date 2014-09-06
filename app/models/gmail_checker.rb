# Copyright ©2012 by James K. Lawless
# See full MIT / X11 license at
# http://www.mailsend-online.com/license2012.php

# Mark all emails in my Gmail inbox as read.

require 'gmail'
require 'mail'

gmail = Gmail.new("shouldisendthis@gmail.com", "4four@dbc")

Mail.defaults do
  delivery_method :smtp, { :address              => "smtp.gmail.com",
                           :port                 => 587,
                           :domain               => 'gmail.com',
                           :user_name            => 'shouldisendthis',
                           :password             => '4four@dbc',
                           :authentication       => 'plain',
                           :enable_starttls_auto => true  }
end

count = 0

gmail.inbox.emails(:unread).each do |msg|
  count = count + 1
  if msg.subject == "[SIST]"
    sender = msg.from[0]
    alchemized_body = "#{msg.body}  has been alchemized...."
    mail = Mail.new do
      from     'shouldisendthis.@gmail.com'
      to       sender
      subject  'Thanks for using Should I Send This?'

      html_part do
        content_type 'text/html; charset=UTF-8'
        body "<h1>Thank you!</h1><p>#{alchemized_body}</p>"
      end
      mail.deliver!
      msg.mark(:read)
    end
  end
end
