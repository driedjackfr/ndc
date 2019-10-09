class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :image_url
      t.integer :point
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
