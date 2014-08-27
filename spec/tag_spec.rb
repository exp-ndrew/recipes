require 'rails_helper'
require 'pry'

describe Tag do
  it { should validate_presence_of :name }
  it { should have_and_belong_to_many :recipes }
  it { should validate_uniqueness_of :name }
end
