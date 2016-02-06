require 'rails_helper'

RSpec.describe "bowlers/edit", type: :view do
  before(:each) do
    @bowler = assign(:bowler, Bowler.create!(
      :name => "MyString",
      :usbc_number => "MyString"
    ))
  end

  it "renders the edit bowler form" do
    render

    assert_select "form[action=?][method=?]", bowler_path(@bowler), "post" do

      assert_select "input#bowler_name[name=?]", "bowler[name]"

      assert_select "input#bowler_usbc_number[name=?]", "bowler[usbc_number]"
    end
  end
end
