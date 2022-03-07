class User < ApplicationRecord
    #relationships
    belongs_to :role 
    has_one :storage_key
    has_many :rsvps
  
    validates :first_name, presence: true, allow_blank: false
    validates :last_name, presence: true, allow_blank: false
    validates :email, presence: true, allow_blank: false
    validates :role_id, presence: true, allow_blank: false
end
