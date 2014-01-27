require 'spec_helper'

describe User do

  before { @user = User.new(name: "Example User", email: "user@example.com") }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }

  it {should be_valid }
  
  describe "when the name is not falid " do
  	before { @user.name = "" }
  	it {should_not be_valid}
  end

  describe "when email is infalid" do
  	before {@user.email =""}
  	it {should_not be_valid}
  end

  describe "when the user name is to long" do
  	before {@user.name = "a" * 50 }
  	it {should_not be_valid}
  end
end