require 'rails_helper'

RSpec.describe "addresses/show", type: :view do
  before(:each) do
    @address = assign(:address, Address.create!(
      :street_1 => "Street 1",
      :street_2 => "Street 2",
      :city => "City",
      :state => "State",
      :zip_code => 1,
      :country => "Country"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Street 1/)
    expect(rendered).to match(/Street 2/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Country/)
  end
end