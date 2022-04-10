# location: spec/unit/instruments_unit_spec.rb
require 'rails_helper'

RSpec.describe Instrument, type: :model do
  subject do
    described_class.new(name: 'drum')
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).not_to be_valid
  end
end