class AddLikeCountToComments < ActiveRecord::Migration
  def change
    add_column :comments, :like_count, :integer, null: false, default: 0
  end
end
