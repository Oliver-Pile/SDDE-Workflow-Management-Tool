require 'rails_helper'

RSpec.describe Project, type: :model do
  it 'can have many cards' do
    expect(subject).to have_many(:cards)
  end

  it 'validates the presence of title' do
    expect(subject).to validate_presence_of(:title)
  end

  it 'validates the uniqueness of title' do
    expect(subject).to validate_uniqueness_of(:title)
  end

  it 'validates the presence of description' do
    expect(subject).to validate_presence_of(:description)
  end

  it 'validates the maximum length of description' do
    expect(subject).to validate_length_of(:description)
  end

  it 'validates the presence of department' do
    expect(subject).to validate_presence_of(:department)
  end
  
end
