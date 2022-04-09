class GigMailer < ApplicationMailer
    def invite_email(event_id, message, user_str_ids)
        event = Event.find_by(id: event_id)
        emails = Array.new
        user_str_ids.each do |id_str|
            user_id = id_str.to_i
            emails << User.find_by(id: user_id).email
        end
        email_text = event_details(event_id) + '\n\n' + message
        mail(from: 'thomasgoodwin@tamu.edu',
             subject: event.name,
             cc: emails,
             message: email_text)
    end
end
