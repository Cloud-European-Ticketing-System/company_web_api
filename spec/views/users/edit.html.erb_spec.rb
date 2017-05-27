require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
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

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

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
