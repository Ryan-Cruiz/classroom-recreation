require 'rails_helper'

RSpec.describe "Subjects", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/subjects"
      expect(response).to have_http_status(:success)
    end
  end

end
