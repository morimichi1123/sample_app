require 'rails_helper'
=begin
RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end
=end

RSpec.describe "multi_access", type: :request do

  it "user_signup" do
  
  get signup_path
  expect(response).to have_http_status(:success)

  end
end
