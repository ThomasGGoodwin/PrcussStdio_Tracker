module HelpMenuHelper
    def check_navbar(role)
        if role == 'Admin'
            render 'shared_partials/admin_nav'
        elsif role == 'Member'
            render 'shared_partials/member_nav'
        end
    end

    def check_privilege(role)
        if role == 'Admin'
            render 'admin_view'
        end
    end
end
