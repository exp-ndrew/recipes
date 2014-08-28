require 'rails_helper'
require 'pry'

describe Recipe do
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  it { should have_and_belong_to_many :tags}
  it { should have_and_belong_to_many :ratings }

  describe 'capitalize_name' do
    it 'capitalizes first word in name' do
      test_recipe = Recipe.create({:name => 'cheesecake brownies', :description => 'do stuff'})
      expect(test_recipe.name).to eq 'Cheesecake brownies'
    end
  end
end
