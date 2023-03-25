class CreateGoodJobLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :good_job_logs do |t|
      t.references :employee, null: false, foreign_key: true
      t.string :ip_address

      t.timestamps
    end
  end
end
