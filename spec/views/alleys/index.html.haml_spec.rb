require 'rails_helper'

RSpec.describe "alleys/index", type: :view do
  before(:each) do
    assign(:alleys, [
      Alley.create!(
        :name => "Name",
        :address_id => 1
      ),
      Alley.create!(
        :name => "Name",
        :address_id => 1
      )
    ])
  end

  it "renders a list of alleys" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
