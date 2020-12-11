class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :party, null: false, foreign_key: true
      t.string :name
      t.integer :level
      t.integer :experience
      t.integer :gold
      t.integer :checkmarks
      t.boolean :active
      t.boolean :retired

      t.timestamps
    end
  end
end
