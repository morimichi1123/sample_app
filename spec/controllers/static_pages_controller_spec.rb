require 'rails_helper'

RSpec.describe "multi_access", type: :request do
  it "ホーム・ヘルプ画面に遷移できる" do

    get static_pages_home_url
    expect(response.status).to eq 200
  #  assert_response :success#要書き換え

    get static_pages_help_url
    expect(response.status).to eq 200
  #  assert_response :success#要書き換え
  
    get static_pages_about_url
  #  assert_response :success#要書き換え
    expect(response.status).to eq 200

  end
end