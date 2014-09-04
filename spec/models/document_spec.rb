require 'rails_helper'

RSpec.describe Document, :type => :model do
  let(:document){ Document.create(title: "Untitled", context: "Test") }

  it { should validate_presence_of :title }

  it "should have a context" do
    expect(document.context).not_to be_nil
  end

  it "should be invalid if title is empty" do
    invalid_document = Document.new(context: "Invalid Test")
    expect(invalid_document).to be_invalid
  end

end
