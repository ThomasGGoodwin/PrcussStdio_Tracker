class User < ApplicationRecord
    # relationships
    belongs_to :role 
    has_one :storage_key
    has_many :rsvps
    
    validates :first_name, presence: true, allow_blank: false
    validates :last_name, presence: true, allow_blank: false
    validates_uniqueness_of :email, presence: true, allow_blank: false
    validates :role_id, presence: true, allow_blank: false

    #grabs the first and last name for the form
    def first_and_last_name 
        "#{first_name} #{last_name}"
    end

end
