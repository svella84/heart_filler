class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.references :campaign, :index => true
      t.references :user, :index => true
      t.references :good, :index => true, :default => 0, :null => false
      t.decimal :donation, :precision => 10, :scale => 2
      t.text :comment

      t.timestamps
    end
  end
end
