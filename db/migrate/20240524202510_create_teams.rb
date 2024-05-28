class CreateTeams < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.references :tournament, null: false, foreign_key: true
      t.string :name, null: false
      t.integer :points, null: false, default: 0

      t.timestamps
    end
  end
end
