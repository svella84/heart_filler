class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.references :campaign, index: true, null: false
      t.references :user, index: true, null: false
      t.references :good, index: true, default: 0, null: false
      t.decimal :donation
      t.text :comment

      t.timestamps
    end
  end
end
