require 'rails_helper'

RSpec.describe User, type: :model do
  it 'validates the presence of username' do
    expect(subject).to validate_presence_of(:username)
  end

  it 'validates the uniqueness of username' do
    expect(subject).to validate_uniqueness_of(:username)
  end

  it 'validates the username doesnt contain invalid characters' do
    expect(subject).not_to allow_value('abc_123').for(:username)
  end
end
