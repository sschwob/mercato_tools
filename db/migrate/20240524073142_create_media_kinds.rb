class CreateMediaKinds < ActiveRecord::Migration[7.0]
  def change
    create_table :media_kinds do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
