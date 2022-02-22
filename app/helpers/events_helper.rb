module EventsHelper
    def toggle_signup_button(user_id, event_id)
        content = ""
        @sign_in = SignIn.where(user_id: user_id, event_id: event_id)
        if @sign_in.length == 1
            content << link_to('Change Status', edit_sign_in_path(@sign_in.first))
        else
            content << link_to('RSVP', new_sign_in_path(:sign_in => { :user_id => current_admin.uid, :event_id => event_id, :signin_time => DateTime.now.utc }))
        end
        content.html_safe
    end
end
