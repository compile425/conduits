class AddAuthorToConduits < ActiveRecord::Migration[7.2]
  def change
    add_reference :conduits, :author, null: true, foreign_key: { to_table: :users }
  end
end
