module EmailParser

  def self.sender(params)
    # extract sender email
   params['sender']
  end

  def self.content(params)
     # extract text
    params['stripped-text']
  end
end
