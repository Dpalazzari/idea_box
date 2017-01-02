class CreateNames < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.string :email

      t.timestamps null: false
    end
  end
end