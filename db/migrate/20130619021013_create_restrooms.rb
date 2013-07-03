class CreateRestrooms < ActiveRecord::Migration
  def change
    create_table :restrooms do |t|
      t.string :business_name
      t.string :category
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :phone_number
      t.text :description

      t.timestamps
    end
  end
end
