class CreateContents < ActiveRecord::Migration[7.0]
  def change
    create_table :contents do |t|
      t.references :user, foreign_key: true
      t.references :media_kind, null: false, foreign_key: true
      t.references :category, foreign_key: true
      t.string :name, null: false
      t.string :language, null: false, default: "FR"
      t.string :source, null: false
      t.text :description, default: ""
      t.boolean :enable, default: false

      t.timestamps
    end
  end
end
