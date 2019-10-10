require 'rails_helper'

RSpec.describe "multi_access", type: :request do
  before do
    @base_title = "Ruby on Rails Tutorial Sample App"
  end
  
  it "ホーム画面などに遷移できる" do

    get root_path
    expect(response.status).to eq 200
    assert_select "title", "Ruby on Rails Tutorial Sample App"
 #  assert_select "a[href=?]", root_path, count: 2

    get help_path
    expect(response.status).to eq 200
    assert_select "title", "Help | Ruby on Rails Tutorial Sample App"
  
    get about_path
    expect(response.status).to eq 200
    assert_select "title", "About | Ruby on Rails Tutorial Sample App"
 #  assert_select "a[href=?]", about_path

    get contact_path
    expect(response.status).to eq 200
    assert_select "title", "Contact | Ruby on Rails Tutorial Sample App"
  end
end
