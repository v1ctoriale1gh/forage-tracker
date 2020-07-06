class Expedition < ApplicationRecord
    belongs_to :user
    has_many :harvests
    has_many :items, through: :harvests
    accepts_nested_attributes_for :harvests
end
