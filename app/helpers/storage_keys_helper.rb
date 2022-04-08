module StorageKeysHelper
    #grabs user first/last name for show/index pages
    def first_and_last_show(user_id)
        first = User.where(id: user_id).limit(1).pluck(:first_name).first()
        last = User.where(id: user_id).limit(1).pluck(:last_name).first()
        return first + " " + last 
    end

    #check if the current user is the owner of the key
    def owner_of_key(user_id, key_id)
        key_id = key_id.to_i
        if user_id == key_id
            link_to 'Edit', edit_storage_key_path(key_id), class:'a-CRUD'
        end
    end

    #def check if user is admin or member and create that view for the index
    def check_priviledges_keys(role)
        if role == "Admin"
            render 'admin_view'
        elsif role == "Member"
            render 'member_view'
        else
            render 'shared_partials/invalid_access'
        end
    end

    #verify admin credentials
    def verify_creds_keys(role, page)
        if role != 'Admin'
            render 'shared_partials/invalid_access'
        elsif page == 'new'
            render 'new'
        end
    end

    #select the approriate navbar based on role
    def keys_navbar(role)
        if role == 'Admin'
            render 'shared_partials/admin_nav'
        elsif role == 'Member'
            render 'shared_partials/member_nav'
        end
    end
end
