class Recipe < ActiveRecord::Base
  validates :name, :presence => true
  validates :description, :presence => true

  # validates_with AssignsValidator

  before_save :capitalize_name

  has_and_belongs_to_many :tags, -> { uniq }
  has_and_belongs_to_many :ratings


  def self.sorted_by_rating
    @results = Recipe.joins(:ratings).group('recipes.id').average(:stars)
    @results = @results.sort_by do |name,average|
      average
    end
    @results.reverse!
    @keys = []
    @results.each do |result|
      @keys << result[0]
    end
    @keys
    @unrated = Recipe.all.ids - @keys
    @keys << @unrated
    @keys.flatten!
  end

  def calculate_average_rating
    (self.ratings.sum(:stars) / self.ratings.count(:stars).to_f).round(2)
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
