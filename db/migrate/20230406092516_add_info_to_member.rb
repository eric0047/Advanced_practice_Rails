class AddInfoToMember < ActiveRecord::Migration[6.1]
  def change
    add_column :members, :address, :string
    add_column :members, :phone, :string
  end
end
