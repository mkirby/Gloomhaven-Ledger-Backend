class CreateUserCampaigns < ActiveRecord::Migration[6.0]
  def change
    create_table :user_campaigns do |t|
      t.belongs_to :user
      t.belongs_to :campaign
      t.boolean :owner

      t.timestamps
    end
  end
end
