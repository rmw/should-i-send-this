# Copyright ©2012 by James K. Lawless
# See full MIT / X11 license at
# http://www.mailsend-online.com/license2012.php
 
# Mark all emails in my Gmail inbox as read.
 
require 'gmail'
require 'mail'

if ARGV.length < 2
 puts "Syntax:\gmail-checker.rb gmail-id gmail-password"
 exit 1
end
 
gmail=Gmail.new(ARGV[0],ARGV[1])
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
 msg.mark(:read)
 count = count + 1
 if msg.subject == "[analyze it!]"
 	  sender = msg.from[0]
 	  alchemized_body = "#{msg.body}  has been alchemized...."
 	  puts "Hello #{msg.from[0]}, Your letter: "
 	  puts "--"
 	  puts msg.body
 	  puts "has been alchemized...."
 	  mail = Mail.new do
  	  from     'shouldisendthis.@gmail.com'
  		to       sender
  		subject  'Here is the alchemized letter'
  		html_part do
    		content_type 'text/html; charset=UTF-8'
    	body "<h1>Funky Title</h1><p>#{alchemized_body}</p>"
      end

  		#body     alchemized_body
 # add_file :filename => 'somefile.png', :content => File.read('/somefile.png')
      end

    mail.deliver!
    else
       puts "#{count}) Subject: #{msg.subject}" 
    end
end