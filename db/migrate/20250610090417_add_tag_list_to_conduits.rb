class AddTagListToConduits < ActiveRecord::Migration[7.2]
  def change
    add_column :conduits, :tag_list, :string
  end
end
