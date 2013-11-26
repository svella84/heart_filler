class CreateGoods < ActiveRecord::Migration
  def change
    create_table :goods do |t|
      t.integer :campaign_id
      t.string :name
      t.string :description
      t.decimal :cost, precision: 10, scale: 2

      t.timestamps
    end
  end
end