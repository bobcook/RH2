class AddExemptToMembers < ActiveRecord::Migration
  def change
    add_column :members, :exempt, :boolean
  end
end
