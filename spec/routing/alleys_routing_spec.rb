require "rails_helper"

RSpec.describe AlleysController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/alleys").to route_to("alleys#index")
    end

    it "routes to #new" do
      expect(:get => "/alleys/new").to route_to("alleys#new")
    end

    it "routes to #show" do
      expect(:get => "/alleys/1").to route_to("alleys#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/alleys/1/edit").to route_to("alleys#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/alleys").to route_to("alleys#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/alleys/1").to route_to("alleys#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/alleys/1").to route_to("alleys#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/alleys/1").to route_to("alleys#destroy", :id => "1")
    end

  end
end
