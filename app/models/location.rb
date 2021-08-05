# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  country    :string           not null
#  city       :string           not null
#  latitude   :float            not null
#  longitude  :float            not null
#  altitude   :float            not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Location < ApplicationRecord
  validates :country, :city, :latitude, :longitude, :altitude, presence: true

  def self.highest_cities_by_nation
    Location.select('MAX(altitude) as max, country, city').group(:country).order('altitude DESC').all
  end
end
