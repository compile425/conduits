class AddBodyToConduits < ActiveRecord::Migration[7.2]
  def change
    add_column :conduits, :body, :text
  end
end
