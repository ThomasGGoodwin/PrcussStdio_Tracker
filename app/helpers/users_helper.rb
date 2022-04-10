module UsersHelper
    def verify_priviledges_users(role, page)
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
        elsif page == 'attendance_report'
            render 'attendance_report'
        end 
    end
end
