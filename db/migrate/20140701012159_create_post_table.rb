class CreatePostTable < ActiveRecord::Migration
  def change
  	create_table :posts do |t|
  		t.string :title 
  		t.text :content 
  		t.string :slug
  		t.string :status, default: "draft" , null: false
  		t.datetime :published_at
  		t.timestamps
  	end
  end
end
