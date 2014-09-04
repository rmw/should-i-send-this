require 'rails_helper'

RSpec.describe Version, :type => :model do
  let(:document){ FactoryGirl.create(:document) }
  let(:version){ document.versions.create(content: "Testing...") }
  let(:version_2){ document.versions.create(content: "Testing 2...") }

  it "should have a document id" do
    expect(version.document_id).to eq(document.id)
  end

  it "should have content" do
    expect(version.content).to eq("Testing...")
  end

  it "should have a version number" do
    expect(version.version_number).to eq(1)
  end

  it "should auto-increment the version number after new version is saved" do
    expect(version.version_number).to eq(1)
    expect(version_2.version_number).to eq(2)
  end

end
