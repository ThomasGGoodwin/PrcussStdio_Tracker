module EventsHelper
    def toggle_signup_button(user_id, event_id)
        content = ""
        @rsvp = Rsvp.where(user_id: user_id, event_id: event_id)
        if @rsvp.length == 1
            content << link_to('Change Status', edit_rsvp_path(@rsvp.first))
        else
            content << link_to('RSVP', new_rsvp_path(:rsvp => { :user_id => current_admin.email, :event_id => event_id, :rsvp_time => DateTime.now.utc }))
        end
        content.html_safe
    end
    def details(event_id)
        event = Event.find(event_id)
        message =  'Title: ' + event.name + "\n"
        message += 'Type: ' + EventType.find(event.event_type_id).description + "\n"
        message += 'Location: ' + event.location + "\n"
        message += 'Time: ' + event.start_time.to_s + ' - ' +  event.end_time.to_s + "\n"
        message += 'Description: ' + event.description
        return message
    end
end
