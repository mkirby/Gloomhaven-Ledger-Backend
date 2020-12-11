class CreateUserCampaigns < ActiveRecord::Migration[6.0]
  def change
    create_table :user_campaigns do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :campaign, null: false, foreign_key: true
      t.boolean :owner

      t.timestamps
    end
  end
end
