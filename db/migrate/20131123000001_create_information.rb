class CreateInformation < ActiveRecord::Migration
  def change
    create_table :information do |t|
      t.integer :user_id
      t.string :name
      t.string :surname
      t.date :date_to_birth
      t.string :province
      t.string :city
      t.string :street
      t.string :poste_code
      t.string :phone
      t.decimal :credit, :default => 0, :null => false, precision: 10, scale: 2
      t.string :image_url

      t.timestamps
    end
  end
end
