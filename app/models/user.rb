class User < ApplicationRecord
    validates :first_name, presence: true, allow_blank: false
    validates :last_name, presence: true, allow_blank: false
    validates :email, presence: true, allow_blank: false
    validates :role, presence: true, allow_blank: false
end
