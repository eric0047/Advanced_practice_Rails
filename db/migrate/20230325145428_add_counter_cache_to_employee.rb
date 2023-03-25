class AddCounterCacheToEmployee < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :good_job_logs_count, :integer, default: 0
  end
end
