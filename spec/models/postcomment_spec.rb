require 'rails_helper'

RSpec.describe Postcomment, type: :model do
  before(:each) do 
    create(:user)
    create(:subject)
    create(:post)
  end
  context "With valid attributes" do 
    it 'should save' do
      expect(build(:postcomment)).to be_valid
    end
  end
  context "With invalid attributes" do 
    it 'must be get an error when content filled blank' do
      expect(build(:postcomment,content: "")).to be_invalid
    end
  end
end
