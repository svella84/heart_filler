class CreateGoods < ActiveRecord::Migration
  def change
    create_table :goods do |t|
      t.references :campaign, index: true
      t.string :name
      t.text :description
      t.decimal :cost, precision: 10, scale: 2
      t.boolean :purchased, default: false

      t.timestamps
    end
  end
end
