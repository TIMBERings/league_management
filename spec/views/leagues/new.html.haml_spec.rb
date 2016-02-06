require 'rails_helper'

RSpec.describe "leagues/new", type: :view do
  before(:each) do
    assign(:league, League.new(
      :name => "MyString",
      :day => "MyString",
      :practice => 1,
      :alley => nil
    ))
  end

  it "renders new league form" do
    render

    assert_select "form[action=?][method=?]", leagues_path, "post" do

      assert_select "input#league_name[name=?]", "league[name]"

      assert_select "input#league_day[name=?]", "league[day]"

      assert_select "input#league_practice[name=?]", "league[practice]"

      assert_select "input#league_alley_id[name=?]", "league[alley_id]"
    end
  end
end
