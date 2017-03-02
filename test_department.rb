require_relative 'department'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/focus'
require 'bundler/setup'
require "active_record"
require_relative 'employee'
require 'pry'
require_relative 'db_connection'
require_relative 'database'
ActiveRecord::Migration.verbose = false

class DepartmentTest < Minitest::Test

  def setup
    CreateEmployeesTable.migrate(:up)
    CreateDepartmentsTable.migrate(:up)
  end

  def teardown
    CreateEmployeesTable.migrate(:down)
    CreateDepartmentsTable.migrate(:down)
  end


  def test_employee_exists
    assert Department
  end

  def test_department_name
    software = Department.create(name: "Software")
    assert_equal "Software", software.name
  end

  def test_adding_employee
    robby = Employee.create(name: "Robby Dore", email_address: "Rdore88@gmail.com",
      phone_number: "404-277-3952",salary: 60000)
    software = Department.create(name: "Software")
    software.add_employee(robby)
    assert_equal software.id,robby.department_id
  end

  def test_total_department_payroll
    robby = Employee.create(name: "Robby Dore", email_address: "Rdore88@gmail.com",
    phone_number: "404-277-3952",salary: 60000)
    ford = Employee.create(name: "Harrison Ford", email_address: "Mr.Kickass@imbetter.com",
    phone_number: "234-562-4345", salary: 100000)
    software = Department.create(name: "Software")
    software.add_employee(robby)
    software.add_employee(ford)
    assert_equal 160000, software.total_department_payroll(Employee.all)
  end

  def test_give_raises_to_all_good_workers
    robby = Employee.create(name: "Robby Dore", email_address: "Rdore88@gmail.com",
    phone_number: "404-277-3952",salary: 60000)
    ford = Employee.create(name: "Harrison Ford", email_address: "Mr.Kickass@imbetter.com",
    phone_number: "234-562-4345", salary: 100000)
    software = Department.create(name: "Software")
    software.add_employee(robby)
    software.add_employee(ford)
    robby.leave_review("Robby is a great worker.")
    ford.leave_review("Harrison has impressed me.")
    software.give_raises_to_all_good_workers(10000)
    robby.reload
    ford.reload
    assert_equal 65000, robby.salary
    assert_equal 105000, ford.salary
  end

  def test_staff
    robby = Employee.create(name: "Robby Dore", email_address: "Rdore88@gmail.com",
    phone_number: "404-277-3952",salary: 60000)
    ford = Employee.create(name: "Harrison Ford", email_address: "Mr.Kickass@imbetter.com",
    phone_number: "234-562-4345", salary: 100000)
    software = Department.create(name: "Software")
    software.add_employee(robby)
    software.add_employee(ford)
    assert_equal 2, software.staff.length
  end

  def test_who_gets_paid_the_least
    ford = Employee.create(name: "Harrison Ford", email_address: "Mr.Kickass@imbetter.com",
    phone_number: "234-562-4345", salary: 100000)
    robby = Employee.create(name: "Robby Dore", email_address: "Rdore88@gmail.com",
    phone_number: "404-277-3952",salary: 60000)
    software = Department.create(name: "Software")
    software.add_employee(ford)
    software.add_employee(robby)
    assert_equal robby, software.who_gets_paid_the_least.first
  end

end
