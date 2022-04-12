# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Role.create(role_description: 'Admin')
Role.create(role_description: 'Member')
Role.create(role_description: 'Pending')

User.create(first_name: 'Luke', last_name: 'Yocum', email: 'yocuml19@tamu.edu', role_id: 1)
User.create(first_name: 'Thomas', last_name: 'Goodwin', email: 'thomasgoodwin@tamu.edu', role_id: 1)
User.create(first_name: 'Steven', last_name: 'Grimshaw', email: 'stevengrimshaw@tamu.edu', role_id: 1)
User.create(first_name: 'Nassef', last_name: 'Ameen', email: 'nameen1@tamu.edu', role_id: 1)
User.create(first_name: 'Cristian', last_name: 'Avalos', email: 'avalos672918@tamu.edu', role_id: 1)
User.create(first_name: 'Wyatt', last_name: 'Smith', email: 'wyattsmith@tamu.edu', role_id: 1)

EventType.create(description: 'Gig')

Event.create(event_type_id: 1,
             name:          'Test Event',
             start_time:    DateTime.strptime("04/11/2022 10:00", "%m/%d/%Y %H:%M"),
             end_time:      DateTime.strptime("04/11/2022 12:00", "%m/%d/%Y %H:%M"),
             location:      'Test Location',
             description:   'Test Description')

Instrument.create(name: 'Drums')
Instrument.create(name: 'Tambourine')

Rsvp.create(user_id: 'thomasgoodwin@tamu.edu',
            event_id: 1,
            rsvp_time: DateTime.now(),
            attending: true,
            reason: '',
            instrument_ids: [1, 2])

Rsvp.create(user_id: 'yocuml19@tamu.edu',
            event_id: 1,
            rsvp_time: DateTime.now(),
            attending: true,
            reason: '',
            instrument_ids: [1])

Rsvp.create(user_id: 'stevengrimshaw@tamu.edu',
            event_id: 1,
            rsvp_time: DateTime.now(),
            attending: true,
            reason: '',
            instrument_ids: [2])

Rsvp.create(user_id: 'avalos672918@tamu.edu',
            event_id: 1,
            rsvp_time: DateTime.now(),
            attending: false,
            reason: 'A fine reason I\'m sure',
            instrument_ids: [2])