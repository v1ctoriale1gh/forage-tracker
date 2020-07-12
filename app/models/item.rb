class Item < ApplicationRecord
    has_many :harvests
    has_many :expeditions, through: :harvests
    
    validates :name, :description, presence: true
end
