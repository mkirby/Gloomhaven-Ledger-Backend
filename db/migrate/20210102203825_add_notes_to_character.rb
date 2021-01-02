class AddNotesToCharacter < ActiveRecord::Migration[6.0]
  def change
    add_column :characters, :notes, :string
  end
end
