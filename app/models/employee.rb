class Employee < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true
  validates :tel, presence: true
  validates :email, presence: true
  has_many :good_job_logs, dependent: :destroy
  # 如果與他相關聯的資料庫被刪掉了，就會跟著刪掉
end
