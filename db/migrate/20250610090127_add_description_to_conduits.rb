class AddDescriptionToConduits < ActiveRecord::Migration[7.2]
  def change
    add_column :conduits, :description, :text
  end
end
