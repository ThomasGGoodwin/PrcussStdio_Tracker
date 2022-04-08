module EventTypesHelper
    def verify_creds_eventtypes(role, page)
        role = 'Member'
        if role != 'Admin'
            render 'shared_partials/invalid_access'
        elsif page == 'index'
            render 'index'
        elsif page == 'edit'
            render 'edit'
        elsif page == 'show'
            render 'show'
        elsif page == 'new'
            render 'new'
        end
    end
end
