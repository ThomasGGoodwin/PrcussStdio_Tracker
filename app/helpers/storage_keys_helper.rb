module StorageKeysHelper

    #grabs user first/last name for show/index pages
    def first_and_last_show(user_id)
        first = User.where(id: user_id).limit(1).pluck(:first_name).first()
        last = User.where(id: user_id).limit(1).pluck(:last_name).first()
        return first + " " + last 
    end
end
