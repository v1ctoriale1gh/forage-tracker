class User < ApplicationRecord
    has_secure_password
    has_many :expeditions
    has_many :harvests, through: :expeditions
    validates :email_address, uniqueness: true
end
