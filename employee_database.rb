require 'active_record'
# require_relative 'employee'

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: "employees.db"
  )

class CreateEmployeesTable < ActiveRecord::Migration[5.0]

  def up
    create_table :employees do |t|
      t.string :name
      t.string :email_address
      t.string :phone_number
      t.integer :salary
      t.string :satisfactory
    end
  end

  def down
    drop_table :employees
  end
end
# CreateEmployeesTable.migrate(:down)
 CreateEmployeesTable.migrate(:up)
