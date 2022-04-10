class GigMailer < ApplicationMailer
    def invite_email(event_id, message, user_emails)
        event = Event.find_by(id: event_id)
        email_text = event.email_string + "\n\n" + message
        return mail(from: ENV['GMAIL_USERNAME'],
                    subject: "Percussion Studio " + event.name + " Details",
                    to: ENV['GMAIL_USERNAME'],
                    cc: user_emails,
                    body: email_text)
    end
end
