class CreatePlayerInfos < ActiveRecord::Migration[7.0]
  def change
    create_table :player_infos do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :skill_rating, default: nil
      t.string :portrait_image, default: nil

      t.timestamps
    end
  end
end
