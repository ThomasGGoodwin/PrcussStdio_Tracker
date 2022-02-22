class User < ApplicationRecord
    belongs_to :admin
    belongs_to :storage_key
    has_many :role
    has_many :sign_in
end
