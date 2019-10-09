require 'rails_helper'



RSpec.describe "multi_access", type: :request do

  before do
    @base_title = "Ruby on Rails Tutorial Sample App"
  end
  
  it "ホーム・ヘルプ画面に遷移できる" do

    get static_pages_home_url
    expect(response.status).to eq 200
    assert_select "title","Home | #{@base_title}"
    
    get static_pages_help_url
    expect(response.status).to eq 200
    assert_select "title","Help | #{@base_title}"
  
    get static_pages_about_url
    expect(response.status).to eq 200
    assert_select "title","About | #{@base_title}"

  end
end