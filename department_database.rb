require 'active_record'
require 'department'
require_relative 'db_connection'

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
