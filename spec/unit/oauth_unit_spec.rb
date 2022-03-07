# # location: spec/unit/oauth_unit_spec.rb
# require 'rails_helper'

# RSpec.describe Admin, type: :model do
#     subject do
#         described_class.new(email: 'avalos672918@tamu.edu', full_name: 'Cristian Avalos', uid: '123456789')
#     end

#     it 'is valid with valid attributes' do
#         expect(subject).to be_valid
#     end

#     it 'is not valid without an email' do
#         subject.email = nil
#         expect(subject).not_to be_valid
#         subject.email = 'avalos672918@tamu.edu'
#     end

#     it 'is not valid without a full name' do
#         subject.full_name = nil
#         expect(subject).not_to be_valid
#         subject.full_name = 'Cristian Avalos'
#     end

#     it 'is not valid without a uid' do
#         subject.uid = nil
#         expect(subject).not_to be_valid
#     end
# end