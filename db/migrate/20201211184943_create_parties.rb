class CreateParties < ActiveRecord::Migration[6.0]
  def change
    create_table :parties do |t|
      t.string :name
      t.string :notes
      t.integer :reputation
      t.belongs_to :campaign, null: false, foreign_key: true

      t.timestamps
    end
  end
end
