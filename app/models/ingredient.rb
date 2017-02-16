class Ingredient < ApplicationRecord
  has_many :doses
  before_destroy :check_for_doses

  validates :name, presence: true
  validates :name, uniqueness: true

  private

  def check_for_doses

    if doses.count > 0
      errors.add_to_base("cannot delete ingredient while doses exist")
      return false
    else
      true
    end
  end

end
