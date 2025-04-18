class RemoveDateFromBlogs < ActiveRecord::Migration[7.1]
  def change
    remove_column :blogs, :date, :date
  end
end
