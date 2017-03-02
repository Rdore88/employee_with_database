require "active_record"
require_relative 'db_connection'
require 'pry'

class Employee < ActiveRecord::Base

  def change_salary(amount)
    self.salary += amount
    self.save
  end

  def leave_review(review_words)
    self.review = review_words
    self.save
  end

  def determine_if_satisfactory

    satisfaction = /great|well|satisfactory|huge asset|impressed/.match(self.review)
    if satisfaction
      "Satisfactory"
    else
      "Unsatisfactory"
    end
  end

  def self.who_makes_more_than_average
    salaries = self.all.map {|el| el.salary}
    total_salaries = salaries.reduce(0.0) {|sum, e| sum + e}
    average_salary = total_salaries/self.all.length
    more_than_average = self.all.select {|el| el.salary > average_salary}
  end

end
