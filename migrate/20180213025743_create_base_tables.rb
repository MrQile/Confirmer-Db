class CreateBaseTables < ActiveRecord::Migration[5.1]
  def change
    create_table :base_tables do |t|
      t.string :name
      t.string :conF_string
      t.timestamps
    end
  end
end
