class Tag < ActiveRecord::Base

  validates :name, :presence => true
  validates_uniqueness_of :name, :case_sensitive => false

  before_validation :capitalize

  has_and_belongs_to_many :recipes, -> { uniq }

  private

  def capitalize
    self.name.capitalize! if self.name
  end

end
