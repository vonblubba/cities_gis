require 'rails_helper'

RSpec.describe Location, type: :model do
  describe 'validations' do
    let(:location) { build(:location) }

    it 'is valid qith all required fields' do
      expect(location).to be_valid
    end

    it 'is invalid without country' do
      location.country = nil
      expect(location).not_to be_valid
    end

    it 'is invalid without city' do
      location.city = nil
      expect(location).not_to be_valid
    end

    it 'is invalid without latitude' do
      location.latitude = nil
      expect(location).not_to be_valid
    end

    it 'is invalid without longitude' do
      location.longitude = nil
      expect(location).not_to be_valid
    end

    it 'is invalid without altitude' do
      location.altitude = nil
      expect(location).not_to be_valid
    end
  end

  describe '#highest_cities_by_nation' do
    let!(:location1) { create(:location, country: 'Italy', altitude: 100.0) }
    let!(:location2) { create(:location, country: 'Italy', altitude: 200.0) }

    let!(:location3) { create(:location, country: 'Scotland', altitude: 300.0) }
    let!(:location4) { create(:location, country: 'Scotland', altitude: 400.0) }

    it 'returns a collection of the highest cities' do
      result = Location.highest_cities_by_nation

      expect(result.first.city).to eq location4.city
      expect(result.second.city).to eq location2.city
    end
  end
end
