require 'rails_helper'

RSpec.describe AddressesController, type: :routing do
  describe 'routing' do
    before :each do
      FactoryGirl.create(:alley)
    end

    it 'routes to #index' do
      expect(get: '/alleys/1/addresses').to route_to('addresses#index', 'alley_id' => '1')
    end

    it 'routes to #new' do
      expect(get: '/alleys/1/addresses/new').to route_to('addresses#new', 'alley_id' => '1')
    end

    it 'routes to #show' do
      expect(get: '/addresses/1').to route_to('addresses#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/addresses/1/edit').to route_to('addresses#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/alleys/1/addresses').to route_to('addresses#create', 'alley_id' => '1')
    end

    it 'routes to #update via PUT' do
      expect(put: '/addresses/1').to route_to('addresses#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/addresses/1').to route_to('addresses#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/addresses/1').to route_to('addresses#destroy', id: '1')
    end
  end
end
