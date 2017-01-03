class AddUserToIdea < ActiveRecord::Migration[5.0]
  def change

    add_reference :ideas, :user, index: true, foreign_key: true
  end
end
