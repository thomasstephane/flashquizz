class UserTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, :password

      t.timestamps 
    end
  end
end
