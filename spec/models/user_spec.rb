require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user){ FactoryGirl.create(:user) }

  it "should have a name" do
    expect(user.name).not_to be_nil
  end

  it "should have a email" do
    expect(user.email).not_to be_nil
  end

  it "should have a password" do
    expect(user.password).not_to be_nil
  end
end
