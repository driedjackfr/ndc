class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :user, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end

    add_column :posts, :comments_count, :integer, null: false, default: 0
    add_column :users, :username, :string, null: false, default: ''
  end
end
