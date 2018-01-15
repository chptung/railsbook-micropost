class AddColumnsToMicrposts < ActiveRecord::Migration[5.1]
  def change
    add_column :microposts, :status, :string
    add_column :microposts, :publish_at, :timestamps
    add_column :microposts, :published_at, :timestamps
  end
end
