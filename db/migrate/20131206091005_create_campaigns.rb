class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :title
      t.text :description
      t.decimal :target, precision: 10, scale: 2
      t.decimal :budget, precision: 10, scale: 2, default: 0.0
      t.datetime :expiration
      t.attachment :image_url
      t.references :user, index: true
      t.references :category, index: true

      t.timestamps
    end
  end
end
