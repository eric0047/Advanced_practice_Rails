class AddIntroToEmployee < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :intro, :string
  end
end
