require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:each) do 
    create(:user)
    create(:subject)
  end
  context "With valid attributes" do 
    it 'should save with due date' do
      expect(build(:post)).to be_valid
    end
    it 'should save without due date' do
      expect(build(:post,due_date: "")).to be_valid
    end
  end
  context "With invalid attributes" do 
    it 'must be get an error when title filled blank' do
      expect(build(:post,title: "")).to be_invalid
    end
    it 'must be get an error when content filled blank' do
      expect(build(:post,content: "")).to be_invalid
    end
  end
end
