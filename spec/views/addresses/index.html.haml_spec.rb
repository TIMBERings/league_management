require 'rails_helper'

RSpec.describe "addresses/index", type: :view do
  before(:each) do
    assign(:addresses, [
      Address.create!(
        :street_1 => "Street 1",
        :street_2 => "Street 2",
        :city => "City",
        :state => "State",
        :zip_code => 1,
        :country => "Country"
      ),
      Address.create!(
        :street_1 => "Street 1",
        :street_2 => "Street 2",
        :city => "City",
        :state => "State",
        :zip_code => 1,
        :country => "Country"
      )
    ])
  end

  it "renders a list of addresses" do
    render
    assert_select "tr>td", :text => "Street 1".to_s, :count => 2
    assert_select "tr>td", :text => "Street 2".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
  end
end
