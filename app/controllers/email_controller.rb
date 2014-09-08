class EmailController < ApplicationController

  def new
    UserMailer.test_email
  end
end
