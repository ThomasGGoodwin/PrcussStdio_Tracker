class Rsvp < ApplicationRecord
    #relationships 
    #belongs_to :user
    #belongs_to :event
    has_many :instrument

    validates :user_id, presence: true, allow_blank: false
    validates :event_id, presence: true, allow_blank: false
    validates :rsvp_time, presence: true, allow_blank: false
    validates :instrument_ids, presence: true, allow_blank: true
    validates :attending, presence: true, allow_blank: true
    validates :reason, presence: true, unless: Proc.new { |s| s.attending==true }
end
