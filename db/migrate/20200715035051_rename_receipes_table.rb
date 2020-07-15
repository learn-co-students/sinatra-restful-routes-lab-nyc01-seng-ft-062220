class RenameReceipesTable < ActiveRecord::Migration
  def change
    rename_table :receipes, :recipes
  end
end
