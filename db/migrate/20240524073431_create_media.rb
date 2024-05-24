class CreateMedia < ActiveRecord::Migration[7.0]
  def change
    create_table :media do |t|
      t.references :media_kind, null: false, foreign_key: true
      t.references :subcategory, null: false, foreign_key: true
      t.string :name, null: false
      t.string :language, null: false, default: "FR"
      t.string :source, null: false
      t.text :description, default: ""

      t.timestamps
    end
  end
end
