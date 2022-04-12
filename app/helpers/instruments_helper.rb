module InstrumentsHelper
    def verify_creds_instruments(role, page)
        #role = 'Member'
        if role != 'Admin'
            render 'shared_partials/invalid_access'
        elsif page == 'index'
            render 'index'
        elsif page == 'show'
            render 'show'
        elsif page == 'edit'
            render 'edit'
        elsif page == 'new'
            render 'new'
        end
    end
end
