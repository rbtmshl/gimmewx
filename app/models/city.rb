class City < ActiveRecord::Base
  attr_accessible :lat, :lon, :name, :state
  validates :lat, presence: true
  validates :lon, presence: true
  validates :name, presence: true
  validates :state, presence: true

  default_scope order: 'cities.name'
end
