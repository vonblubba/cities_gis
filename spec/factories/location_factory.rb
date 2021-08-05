FactoryBot.define do
  factory :location do
    city { FFaker::Address.city }
    country { FFaker::Address.country }
    latitude { FFaker::Geolocation.lat }
    longitude { FFaker::Geolocation.lng }
    altitude { rand(0.0..3000.0) }
  end
end
