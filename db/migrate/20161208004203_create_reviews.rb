class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.integer :reviewer_id, { null: false }
      t.integer :movie_id, { null: false }
      t.integer :score, { null: false }
      t.string :title, { null: false }
      t.text :content, { null: false }
      t.text :conclusion, { null: false }
      t.string :timestamps
    end
  end
end
