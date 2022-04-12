class Instrument < ApplicationRecord
    has_and_belongs_to_many :rsvp

    validates :name, presence: true, allow_blank: false
end
