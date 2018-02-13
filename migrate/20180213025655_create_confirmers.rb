class CreateConfirmers < ActiveRecord::Migration[5.1]
  def change
    create_table :confirmers do |t|
      t.string :name
      t.integer :position
      t.timestamps
    end
  end
end
