require 'rails_helper'

RSpec.describe "addresses/new", type: :view do
  before(:each) do
    assign(:address, Address.new(
      :street_1 => "MyString",
      :street_2 => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip_code => 1,
      :country => "MyString"
    ))
  end

  it "renders new address form" do
    render

    assert_select "form[action=?][method=?]", addresses_path, "post" do

      assert_select "input#address_street_1[name=?]", "address[street_1]"

      assert_select "input#address_street_2[name=?]", "address[street_2]"

      assert_select "input#address_city[name=?]", "address[city]"

      assert_select "input#address_state[name=?]", "address[state]"

      assert_select "input#address_zip_code[name=?]", "address[zip_code]"

      assert_select "input#address_country[name=?]", "address[country]"
    end
  end
end
