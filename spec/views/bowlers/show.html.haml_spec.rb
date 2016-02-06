require 'rails_helper'

RSpec.describe "bowlers/show", type: :view do
  before(:each) do
    @bowler = assign(:bowler, Bowler.create!(
      :name => "Name",
      :usbc_number => "Usbc Number"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Usbc Number/)
  end
end
