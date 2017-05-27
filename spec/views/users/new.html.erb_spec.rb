require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      :first_name => "",
      :last_name => "",
      :email => "",
      :country => "",
      :address => "",
      :telephone => "",
      :password => "",
      :role => "",
      :company => nil
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input[name=?]", "user[first_name]"

      assert_select "input[name=?]", "user[last_name]"

      assert_select "input[name=?]", "user[email]"

      assert_select "input[name=?]", "user[country]"

      assert_select "input[name=?]", "user[address]"

      assert_select "input[name=?]", "user[telephone]"

      assert_select "input[name=?]", "user[password]"

      assert_select "input[name=?]", "user[role]"

      assert_select "input[name=?]", "user[company_id]"
    end
  end
end
