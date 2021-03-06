require 'rails_helper'

RSpec.describe TeamsController, type: :routing do
  describe 'routing' do
    before :each do
      FactoryGirl.create(:league)
    end
    it 'routes to #index' do
      expect(get: '/leagues/1/teams').to route_to('teams#index', 'league_id' => '1')
    end

    it 'routes to #new' do
      expect(get: '/leagues/1/teams/new').to route_to('teams#new', 'league_id' => '1')
    end

    it 'routes to #show' do
      expect(get: '/teams/1').to route_to('teams#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/teams/1/edit').to route_to('teams#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/leagues/1/teams').to route_to('teams#create', 'league_id' => '1')
    end

    it 'routes to #update via PUT' do
      expect(put: '/teams/1').to route_to('teams#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/teams/1').to route_to('teams#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/teams/1').to route_to('teams#destroy', id: '1')
    end
  end
end
