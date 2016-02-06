require 'rails_helper'

RSpec.describe "alleys/edit", type: :view do
  before(:each) do
    @alley = assign(:alley, Alley.create!(
      :name => "MyString",
      :address_id => 1
    ))
  end

  it "renders the edit alley form" do
    render

    assert_select "form[action=?][method=?]", alley_path(@alley), "post" do

      assert_select "input#alley_name[name=?]", "alley[name]"

      assert_select "input#alley_address_id[name=?]", "alley[address_id]"
    end
  end
end
