require 'rails_helper'
require 'pry'

describe Recipe do
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }

  describe 'capitalize_name' do
    it 'capitalizes first word in name' do
      test_recipe = Recipe.create({:name => 'cheesecake brownies', :description => 'do stuff'})
      binding.pry
      expect(test_recipe.name).to eq 'Cheesecake brownies'
    end
  end
end
