require 'spec_helper'

describe Restaurant, type: :model do
  it 'is not valid with a name of less than 3 characters' do
    restaurant = Restaurant.new name: 'KF'
    expect(restaurant).to have(1).error_on :name
    expect(restaurant).not_to be_valid
  end

  it 'is not valid if another restaurant has the same name' do
    Restaurant.create name: 'KFC'
    restaurant = Restaurant.new name: 'KFC'
    expect(restaurant).to have(1).error_on :name
    expect(restaurant).not_to be_valid
  end
end
