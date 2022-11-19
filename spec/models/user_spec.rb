require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user1 = create(:user)
  end
  
  it "it should be valid" do
    expect(@user1).to be_valid
  end
  
end