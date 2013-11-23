class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :campaign_id
      t.integer :user_id
      t.integer :good_id
      t.decimal :donation, precision: 10, scale: 2
      t.text :comment

      t.timestamps
    end
  end
end
