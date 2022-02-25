class SignIn < ApplicationRecord
    validates :user_id, presence: true, allow_blank: false
    validates :event_id, presence: true, allow_blank: false
    validates :signin_time, presence: true, allow_blank: false
    validates :attending, presence: true, allow_blank: false
    validates :reason, presence: true, unless: Proc.new { |s| s.attending==true }
end
