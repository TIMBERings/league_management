require 'rails_helper'

RSpec.describe "leagues/edit", type: :view do
  before(:each) do
    @league = assign(:league, League.create!(
      :name => "MyString",
      :day => "MyString",
      :practice => 1,
      :alley => nil
    ))
  end

  it "renders the edit league form" do
    render

    assert_select "form[action=?][method=?]", league_path(@league), "post" do

      assert_select "input#league_name[name=?]", "league[name]"

      assert_select "input#league_day[name=?]", "league[day]"

      assert_select "input#league_practice[name=?]", "league[practice]"

      assert_select "input#league_alley_id[name=?]", "league[alley_id]"
    end
  end
end
