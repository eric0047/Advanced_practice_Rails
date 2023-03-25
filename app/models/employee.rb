class Employee < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true
  validates :tel, presence: true
  validates :email, presence: true
  has_many :good_job_logs
end
