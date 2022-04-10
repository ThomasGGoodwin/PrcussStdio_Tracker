# location: spec/unit/events_unit_spec.rb
require 'rails_helper'

RSpec.describe Event, type: :model do
  subject do
    event_type = EventType.new
    event_type.id = 1
    event_type.description = 'EventTypeTest'
    event_type.save
    described_class.new(event_type_id: 1, name: 'EventTest', start_time: '2022-02-17 01:01:00', end_time: '2022-02-17 02:01:00', location: 'LocationTest', description: 'DescriptionTest')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without an event type' do
    subject.event_type_id = nil
    expect(subject).not_to be_valid
  end
end

RSpec.describe Event, type: :model do
    subject do
      event_type = EventType.new
      event_type.id = 1
      event_type.description = 'EventTypeTest'
      event_type.save
      described_class.new(event_type_id: 1, name: 'EventTest', start_time: '2022-02-17 01:01:00', end_time: '2022-02-17 02:01:00', location: 'LocationTest', description: 'DescriptionTest')
    end
  
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
  
    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).not_to be_valid
    end
  end

  RSpec.describe Event, type: :model do
    subject do
      event_type = EventType.new
      event_type.id = 1
      event_type.description = 'EventTypeTest'
      event_type.save
      described_class.new(event_type_id: 1, name: 'EventTest', start_time: '2022-02-17 01:01:00', end_time: '2022-02-17 02:01:00', location: 'LocationTest', description: 'DescriptionTest')
    end
  
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
  
    it 'is not valid without a start time' do
      subject.start_time = nil
      expect(subject).not_to be_valid
    end
  end

  RSpec.describe Event, type: :model do
    subject do
      event_type = EventType.new
      event_type.id = 1
      event_type.description = 'EventTypeTest'
      event_type.save
      described_class.new(event_type_id: 1, name: 'EventTest', start_time: '2022-02-17 01:01:00', end_time: '2022-02-17 02:01:00', location: 'LocationTest', description: 'DescriptionTest')
    end
  
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
  
    it 'is not valid without an end time' do
      subject.end_time = nil
      expect(subject).not_to be_valid
    end
  end

  RSpec.describe Event, type: :model do
    subject do
      event_type = EventType.new
      event_type.id = 1
      event_type.description = 'EventTypeTest'
      event_type.save
      described_class.new(event_type_id: 1, name: 'EventTest', start_time: '2022-02-17 01:01:00', end_time: '2022-02-17 02:01:00', location: 'LocationTest', description: 'DescriptionTest')
    end
  
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
  
    it 'is not valid without a location' do
      subject.location = nil
      expect(subject).not_to be_valid
    end
  end

  RSpec.describe Event, type: :model do
    subject do
      event_type = EventType.new
      event_type.id = 1
      event_type.description = 'EventTypeTest'
      event_type.save
      described_class.new(event_type_id: 1, name: 'EventTest', start_time: '2022-02-17 01:01:00', end_time: '2022-02-17 02:01:00', location: 'LocationTest', description: 'DescriptionTest')
    end
  
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
  
    it 'is not valid without a description' do
      subject.description = nil
      expect(subject).not_to be_valid
    end
  end