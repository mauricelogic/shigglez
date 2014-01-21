class AddDetailsToVenue < ActiveRecord::Migration
  def change
    add_column :venues, :lat, :float
    add_column :venues, :long, :float
    add_column :venues, :city, :string
    add_column :venues, :state, :string
    add_column :venues, :phone, :string
  end
end
