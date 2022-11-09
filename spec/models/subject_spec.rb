require 'rails_helper'

RSpec.describe Subject, type: :model do
  before(:each) do 
    create(:user)
  end
  context "With valid attributes" do 
    it 'should save' do
      expect(build(:subject)).to be_valid
    end
  end
  context "With invalid attributes" do 
    it 'must be get an error when title filled blank' do
      expect(build(:subject,title: "")).to be_invalid
    end
    it 'must be get an error when section filled blank' do
      expect(build(:subject,section: "")).to be_invalid
    end
  end
end
