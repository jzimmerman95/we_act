class CreateUser < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :name
    	t.text :bio
    	t.string :city
    	t.string :state

    	t.timestamps
    end
  end
end
