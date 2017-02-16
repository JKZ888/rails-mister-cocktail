class AddIngredientRefToDoses < ActiveRecord::Migration[5.0]
  def change
    add_reference :doses, :ingredient, foreign_key: true
  end
end
