class AddCookTimeToBlogs < ActiveRecord::Migration[7.1]
  def change
    add_column :blogs, :cook_time, :integer
  end
end
