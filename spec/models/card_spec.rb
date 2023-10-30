require 'rails_helper'

RSpec.describe Card, type: :model do
  it 'validates the presence of content' do
    expect(subject).to validate_presence_of(:content)
  end

  it 'validates the presence of status' do
    expect(subject).to validate_presence_of(:status)
  end

  it 'belongs to a project' do
    expect(subject).to belong_to :project
  end

  it 'validates status cant be set to a random value' do
    expect(subject).not_to allow_value('foo').for(:status)
  end
end
