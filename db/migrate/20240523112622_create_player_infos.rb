class CreatePlayerInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :player_infos do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :skill_rating
      t.string :portrait_image

      t.timestamps
    end
  end
end
