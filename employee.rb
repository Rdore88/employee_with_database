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

end
