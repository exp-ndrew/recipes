class Recipe < ActiveRecord::Base
  validates :name, :presence => true
  validates :description, :presence => true

  # validates_with AssignsValidator

  before_save :capitalize_name

  has_and_belongs_to_many :tags, -> { uniq }
  belongs_to :rating

  def print_stars
    result = ''
    self.rating.stars.times do
      result += "\u2605"
    end
    result.encode('utf-8')
  end

  scope :favorites, -> { Recipe.joins(:rating).where('ratings.stars >= ?', 4) }

  private

  def capitalize_name
    self.name = self.name.capitalize
  end

  def validate(tag_id)
    if self.tags.find(tag_id).exists?
      record.errors[:base] << "This tag has already been added."
    end
  end
end
