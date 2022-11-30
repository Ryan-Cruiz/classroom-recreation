require 'rails_helper'

RSpec.describe SpecificSubject, type: :model do
    before(:each) do 
        create(:user)
        create(:subject)
      end
    context "With valid attributes" do 
        it "should save" do 
          expect(build(:specific_subject)).to be_valid
        end
    end
end
