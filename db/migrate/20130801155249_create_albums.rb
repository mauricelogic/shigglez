class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.references :restroom
      t.string :title

      t.timestamps
    end
    
    add_index :albums, :restroom_id
  end
end
