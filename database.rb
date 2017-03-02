require 'active_record'
require_relative 'db_connection'

class CreateEmployeesTable < ActiveRecord::Migration[5.0]

  def up
    create_table :employees do |t|
      t.string :name
      t.string :email_address
      t.string :phone_number
      t.integer :salary
      t.string :satisfactory
      t.integer :department_id
      t.text :review
    end
  end

  def down
    drop_table :employees
  end
end
#CreateEmployeesTable.migrate(:down)
 CreateEmployeesTable.migrate(:up)

 class CreateDepartmentsTable < ActiveRecord::Migration[5.0]

   def up
     create_table :departments do |t|
       t.string :name
     end
   end

   def down
     drop_table :departments
   end
 end
 #CreateEmployeesTable.migrate(:down)
  CreateDepartmentsTable.migrate(:up)
