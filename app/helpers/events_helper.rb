module EventsHelper
    def toggle_signup_button(user_id, event_id)
        content = ""
        @rsvp = Rsvp.where(user_id: user_id, event_id: event_id)

        if !@rsvp.exists?
            content << link_to('RSVP', new_rsvp_path(:rsvp => { :user_id => current_admin.email, :event_id => event_id, :rsvp_time => DateTime.now.utc }), class:"a-CRUD")
        else
            status = @rsvp.first.attending ? 'Attending' : 'Not Attending'
            content << link_to('Change Status: ' + status, edit_rsvp_path(@rsvp.first), class:"a-CRUD")
        end
        content.html_safe
    end

    def check_priviledges_gigmaster(role)
        if role == 'Admin'
            render 'gig_master'
        else 
            render 'shared_partials/invalid_access'
        end
    end

    def check_priviledges_events(role, page)
        if role == 'Admin'
            if page == 'new'
                render 'new'
            elsif page == 'edit'
                render 'edit'
            elsif page == 'show'
                render 'show'
                
            end
        elsif role == 'Member'
            if page == 'show'
                render 'show'
            else
                render 'shared_partials/invalid_access'
            end
        else 
            render 'shared_partials/invalid_access'
        end
    end

    def proper_nav(role)
        if role == 'Admin'
            render 'shared_partials/admin_nav'
        elsif role == 'Member'
            render 'shared_partials/member_nav'
        end
    end
end
