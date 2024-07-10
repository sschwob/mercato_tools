class AddCategorieReference < ActiveRecord::Migration[7.0]
  def change
    add_reference :categories, :parent, foreign_key: { to_table: :categories }
  end
end
