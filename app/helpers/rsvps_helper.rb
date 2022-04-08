module RsvpsHelper
    def get_user_name(user_id)
        content = ""
        @user = User.where(email: user_id)
        if @user.length == 1
            content << @user.first.last_name + ", " + @user.first.first_name
        else
            content << user_id
        end
        content.html_safe
    end

    def verify_creds_rsvp(role)
        if role != 'Admin'
            render 'shared_partials/invalid_access'
        else
            render 'index'
        end
    end

    #select the approriate navbar based on role
    def rsvp_navbar(role)
        if role == 'Admin'
            render 'shared_partials/admin_nav'
        elsif role == 'Member'
            render 'shared_partials/member_nav'
        end
    end

    #change exit point based on role
    def rsvp_back(role)
        if role == 'Admin'
            link_to 'Back', rsvps_path, class:'btn btn-secondary a-primary'
        elsif role =='Member'
            link_to 'Back', root_url, class:'btn btn-secondary a-primary'
        end
    end
end
