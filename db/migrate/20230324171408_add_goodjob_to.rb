class AddGoodjobTo < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :goodjob, :integer, default: 0
  end
end
