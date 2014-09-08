require 'rails_helper'

RSpec.describe Comment, :type => :model do
  let(:document){ FactoryGirl.create(:document) }
  let(:version){ document.versions.create(content: "Version Content") }
  let(:user){ FactoryGirl.create(:user) }
  let(:comment){ version.comments.create(body: "Comment Body", user: user) }

  it "should have a comment id" do
    expect(comment.id).not_to be_nil
  end

  it "should have a body" do
    expect(comment.body).not_to be_nil
  end

  it "should have a user" do
    expect(comment.user).not_to be_nil
  end

  it "should belong to a version" do
    expect(comment.version).not_to be_nil
  end
end
