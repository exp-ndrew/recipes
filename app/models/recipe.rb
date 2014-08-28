class Recipe < ActiveRecord::Base
  validates :name, :presence => true
  validates :description, :presence => true

  # validates_with AssignsValidator

  before_save :capitalize_name

  has_and_belongs_to_many :tags, -> { uniq }
  belongs_to :rating

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

