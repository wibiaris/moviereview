class CreateMoviews < ActiveRecord::Migration
  def change
    create_table :moviews do |t|
      t.string :title
      t.text :description
      t.string :movie_length
      t.string :director
      t.string :rating

      t.timestamps
    end
  end
end
