class CreateCampaignsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :campaigns do |t|
      t.string :name
    end
  end
end
