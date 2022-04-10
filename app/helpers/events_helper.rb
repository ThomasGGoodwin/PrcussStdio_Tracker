module EventsHelper
    def toggle_signup_button(user_id, event_id)
        content = ""
        @rsvp = Rsvp.where(user_id: user_id, event_id: event_id)
        if @rsvp.length == 1
            content << link_to('Change Status', edit_rsvp_path(@rsvp.first), class:"a-CRUD")
        else
            content << link_to('RSVP', new_rsvp_path(:rsvp => { :user_id => current_admin.email, :event_id => event_id, :rsvp_time => DateTime.now.utc }), class:"a-CRUD")
        end
        content.html_safe
    end
end
