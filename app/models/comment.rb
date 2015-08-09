class Comment < ActiveRecord::Base

  belongs_to :house

  def like!
    increment!(:like_count)
  end
end
