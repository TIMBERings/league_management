require 'rails_helper'

RSpec.describe "bowlers/index", type: :view do
  before(:each) do
    assign(:bowlers, [
      Bowler.create!(
        :name => "Name",
        :usbc_number => "Usbc Number"
      ),
      Bowler.create!(
        :name => "Name",
        :usbc_number => "Usbc Number"
      )
    ])
  end

  it "renders a list of bowlers" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Usbc Number".to_s, :count => 2
  end
end
