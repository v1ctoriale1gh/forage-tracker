class User < ApplicationRecord
    has_secure_password
    has_many :expeditions
    has_many :harvests, through: :expeditions
    has_many :items
end
