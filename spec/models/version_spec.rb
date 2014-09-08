require 'rails_helper'

RSpec.describe Version, :type => :model do
  let(:document){ FactoryGirl.create(:document) }
  let(:version){ document.versions.create(content: "Testing...") }
  let(:version_2){ document.versions.create(content: "Testing 2...") }

  it "belongs to a document" do
    expect(version).to respond_to(:document)
  end

  it "has content" do
    expect(version).to respond_to(:content)
  end

  it "has a version number" do
    expect(version.version_number).to eq(1)
  end

  it "should auto-increment the version number after new version is saved" do
    expect(version.version_number).to eq(1)
    expect(version_2.version_number).to eq(2)
  end

end
