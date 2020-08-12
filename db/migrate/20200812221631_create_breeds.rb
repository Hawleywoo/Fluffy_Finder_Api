class CreateBreeds < ActiveRecord::Migration[6.0]
  def change
    create_table :breeds do |t|
      t.string :name
      t.string :weight
      t.string :height
      t.string :temperament
      t.string :life_span
      t.string :alt_names
      t.string :origin
      t.string :country_code
      t.string :image_url

      t.timestamps
    end
  end
end
