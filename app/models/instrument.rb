class Instrument < ApplicationRecord
    has_many :rsvp

    validates :name, presence: true, allow_blank: false
end
