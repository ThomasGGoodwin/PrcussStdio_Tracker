class StorageKey < ApplicationRecord
    #relationship
    belongs_to :user 

    validates :user_id, presence: true, allow_blank: false
end
