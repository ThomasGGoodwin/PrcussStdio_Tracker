module UsersHelper
    def verify_priviledges_users(role, page)
        role = 'Admin'
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

    def duplicate_user(email)
        content= ''
        if User.exists?(email: email)
            render '<p>You have already requested access</p>'
        else
            render 'pending_form', user: @user
        end
        content.html_safe
    end

end
