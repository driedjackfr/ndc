class AddPublicPostRefToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :status, :integer, default: 0
    add_reference :posts, :public_post, index: true
  end
end
