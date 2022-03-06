class User < ApplicationRecord
    #relationships
    belongs_to :role 
    has_one :storage_key
    has_many :rsvps
end
