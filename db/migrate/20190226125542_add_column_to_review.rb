class AddColumnToReview < ActiveRecord::Migration[5.2]
  def change
  	add_column :reviews, :review_body,    :string
  end
end
