class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :content
      t.integer :restroom_id
      t.references :restroom
    

      t.timestamps
    end
    add_index :reviews, :restroom_id
  end
end
