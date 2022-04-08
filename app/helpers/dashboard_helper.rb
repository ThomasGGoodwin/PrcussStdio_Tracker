module DashboardHelper
    def check_priviledge(role)
        content = ''
        if role == 'Admin' || role == 'Member'
            if role == 'Admin'
                render 'admin_view'
            else
                render 'member_view'
            end
        else
            render 'non-member_view'
        end
    end
end