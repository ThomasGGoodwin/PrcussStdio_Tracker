module HelpMenuHelper
    def check_privilege(role)
        if role == 'Admin'
            render 'admin_view'
        end
    end
end
