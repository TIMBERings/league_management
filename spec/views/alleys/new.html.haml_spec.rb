require 'rails_helper'

RSpec.describe "alleys/new", type: :view do
  before(:each) do
    assign(:alley, Alley.new(
      :name => "MyString",
      :address_id => 1
    ))
  end

  it "renders new alley form" do
    render

    assert_select "form[action=?][method=?]", alleys_path, "post" do

      assert_select "input#alley_name[name=?]", "alley[name]"

      assert_select "input#alley_address_id[name=?]", "alley[address_id]"
    end
  end
end
