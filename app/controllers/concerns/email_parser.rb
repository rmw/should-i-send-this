module EmailParser

  def self.sender(params)
    # extract sender email
   params['sender']
  end

  def self.raw_content
     # extract text
    params["stripped-text"]
  end
end
