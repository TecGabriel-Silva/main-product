class AddCategoryIdToProducao < ActiveRecord::Migration[7.0]
  def change
    add_column :producaos, :category_id, :integer
  end
end
