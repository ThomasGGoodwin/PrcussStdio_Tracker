# location: spec/feature/pending_user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
    subject do
        # Create role
        role = Role.new
        role.id = 1
        role.role_description = 'Pending'
        role.save
        described_class.new(first_name: 'Test', last_name: 'User', email: 'email@tamu.edu', role_id: 1)
    end

    it 'is valid with valid attributes' do
        expect(subject).to be_valid
    end

    it 'is not valid without a first name' do
        subject.first_name = nil
        expect(subject).not_to be_valid
    end

    it 'is not valid without a last name' do
        subject.last_name = nil
        expect(subject).not_to be_valid
    end

    it 'is not valid without an email' do
        subject.email = nil
        expect(subject).not_to be_valid
    end

    it 'is not valid without a role' do
        subject.role = nil
        expect(subject).not_to be_valid
    end
end
