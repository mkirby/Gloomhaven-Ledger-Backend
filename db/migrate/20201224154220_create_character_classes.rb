class CreateCharacterClasses < ActiveRecord::Migration[6.0]
  def change
    create_table :character_classes do |t|
      t.string :fullname
      t.string :name
      t.string :name_hidden
      t.string :abbreviation
      t.integer :max_ability_cards
      t.integer :events_on_unlock
      t.integer :events_on_retirement
      t.string :img_mat_front
      t.string :img_mat_back
      t.string :img_portrait
      t.string :img_icon
      t.json :health
      t.string :description

      t.timestamps
    end
  end
end
