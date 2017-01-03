class Ideas < ActiveRecord::Migration[5.0]
  def change
    create_table :ideas do |t|
      t.string :name
      t.string :description

      t.timestamp null: false
    end
  end
end
