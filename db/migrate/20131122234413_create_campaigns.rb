class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.integer :category_id
      t.integer :user_id
      t.string :title
      t.text :description
      t.decimal :target, precision: 10, scale: 2
      t.decimal :budget, :default => 0, :null => false, precision: 10, scale: 2
      t.datetime :expiration
      t.string :image_url

      t.timestamps
    end
  end
end
