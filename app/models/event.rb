class Event < ApplicationRecord
<<<<<<< HEAD
    validates :event_type, presence: true, allow_blank: false
=======
    #relationships
    belongs_to :event_type
    has_many :rsvp 

    validates :event_type_id, presence: true, allow_blank: false
>>>>>>> test
    validates :name, presence: true, allow_blank: false
    validates :start_time, presence: true, allow_blank: false
    validates :end_time, presence: true, allow_blank: false
    validates :location, presence: true, allow_blank: false
    validates :description, presence: true, allow_blank: false
end
