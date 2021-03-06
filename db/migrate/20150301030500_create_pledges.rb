class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.references :project, index: true
      t.string :name
      t.string :email
      t.integer :amount
	  t.references :funding_level
      t.timestamps null: false
    end
    add_foreign_key :pledges, :projects
  end
end
