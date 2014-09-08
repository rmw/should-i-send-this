require 'rails_helper'

describe AlchemyData do
  # let(:alchemy_data) { AlchemyData.new("As a collection of such stories, mythology is an important feature of  every culture. Various origins for myths have been proposed, ranging from personification of natural phenomena to truthful or hyperbolic accounts of historical events, to explanations of existing ritual. Although the term is complicated by its implicit condescension, mythologizing is not just an ancient or primitive practice, as shown by contemporary mythopoeia such as urban legends and the expansive fictional mythoi created by fantasy novels and Japanese manga. A culture's collective mythology helps convey belonging, shared and religious experience, behavioral models, and moral and practical lessons.") }

  # it "should have a method get keywords that adds keywords to keywords array" do
  #   expect(alchemy_data.keywords.size).to_not equal(0)
  # end

  # it "should have a method get concepts that adds concepts to concepts array" do
  #   expect(alchemy_data.keywords.size).to_not equal(0)
  # end

  # it "should have a method get sentiment that returns a float between -1 and 1" do
  #   expect(alchemy_data.sentiment).to be_between(-1, 1)
  # end

  it "is a class" do
    expect(AlchemyData).to respond_to(:new)
  end

end
