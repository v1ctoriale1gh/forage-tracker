class Expedition < ApplicationRecord
    belongs_to :user
    has_many :harvests
    has_many :items, through: :harvests
    accepts_nested_attributes_for :harvests, reject_if: proc { |attributes| attributes['amount'].blank? }

    validates :location_name, :street, :street_number, :zipcode, :city, :state, :country, presence: true

    scope :location_group, -> { order("location_name")}

    #Geocoder macro and validator for google maps 
    before_save :set_address
    geocoded_by :address
    before_create :geocode

    def set_address
      self.address = [street, street_number, zipcode, city, state, country].join(',')
    end

    #def location_harvests
    #  self.expeditions.group(:location_name).collect(&:harvests)
   #end

end
