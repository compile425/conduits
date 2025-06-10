class CreateConduits < ActiveRecord::Migration[7.2]
  def change
    create_table :conduits do |t|
      t.string :title

      t.timestamps
    end
  end
end
