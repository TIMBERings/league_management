require 'rails_helper'

RSpec.describe "bowlers/new", type: :view do
  before(:each) do
    assign(:bowler, Bowler.new(
      :name => "MyString",
      :usbc_number => "MyString"
    ))
  end

  it "renders new bowler form" do
    render

    assert_select "form[action=?][method=?]", bowlers_path, "post" do

      assert_select "input#bowler_name[name=?]", "bowler[name]"

      assert_select "input#bowler_usbc_number[name=?]", "bowler[usbc_number]"
    end
  end
end
