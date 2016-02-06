require 'rails_helper'

RSpec.describe "alleys/show", type: :view do
  before(:each) do
    @alley = assign(:alley, Alley.create!(
      :name => "Name",
      :address_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
  end
end
