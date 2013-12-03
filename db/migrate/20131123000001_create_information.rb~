class CreateInformation < ActiveRecord::Migration
  def change
    create_table :information do |t|
      t.integer :user_id
      t.string :name
      t.string :surname
      t.date :date_of_birth
      t.string :address
      t.string :city
      t.string :country
      t.string :poste_code
      t.string :phone
      t.decimal :credit, :default => 0, :null => false, precision: 10, scale: 2
      t.attachment :image_url

      t.timestamps
    end
  end
end
