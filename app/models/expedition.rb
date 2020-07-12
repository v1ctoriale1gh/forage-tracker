class Expedition < ApplicationRecord
    belongs_to :user
    has_many :harvests
    has_many :items, through: :harvests
    accepts_nested_attributes_for :harvests, reject_if: proc { |attributes| attributes['amount'].blank? }

    validates :location_name, :description, presence: true
end
