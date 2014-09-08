require 'rails_helper'

RSpec.describe Document, :type => :model do
  let(:document){ Document.create(title: "Untitled", context: "Test") }

  it { should validate_presence_of :title }

  it "has a context" do
    expect(document).to respond_to(:context)
  end

end
