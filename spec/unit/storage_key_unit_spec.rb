# location: spec/unit/storage_key_unit_spec.rb
require 'rails_helper'

RSpec.describe StorageKey, type: :model do
  subject do
    # Create role
    role = Role.new
    role.id = 1
    role.role_description = 'Admin'
    role.save
    # Create User
    user = User.new
    user.id = 1
    user.first_name = 'Luke'
    user.last_name = 'Yocum'
    user.email = 'yocuml19@tamu.edu'
    user.role_id = 1
    user.save
    described_class.new(user_id: '1')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.user_id = nil
    expect(subject).not_to be_valid
  end
end