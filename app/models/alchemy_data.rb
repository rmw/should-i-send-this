class AlchemyData
  attr_reader :keywords, :concepts, :sentiment

  def initialize(content)
    @alchemyapi = AlchemyAPI.new()
    @content = content
    @keywords = []
    @concepts = []
    @sentiment = 0
    get_keywords
    get_concepts
    get_sentiment
  end

  def get_keywords
    response = @alchemyapi.keywords('text', @content, { 'sentiment'=>1 })
    response['keywords'].each { |keyword| @keywords << keyword['text'] }
  end

  def get_concepts
    response = @alchemyapi.concepts('text', @content)
    response['concepts'].each { |concept| @concepts << concept['text'] }
  end

  def get_sentiment
    response = @alchemyapi.sentiment('text', @content)
    @sentiment = response['docSentiment']['score'].to_f
  end

end


# HOW TO USE THIS OBJECT

# initialize the object with text
# alchemy_object = AlchemyData.new("hello, please analyze this")

# how to output data
# alchemy_object.keywords
#    => returns array of keywords in descending order of relevance
# alchemy_object.concepts
#    => returns array of concepts in descending order of relevance
# alchemy_object.sentiment
#    => returns sentiment as a float between 0 and 1




