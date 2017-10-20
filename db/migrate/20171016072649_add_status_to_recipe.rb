class AddStatusToRecipe < ActiveRecord::Migration[5.1]
  def change
  	add_column :recipes, :status, :integer, default: 0, null: false
  end
end
