class ChangeDatatypeTypeOfNotifications < ActiveRecord::Migration[6.1]
  def change
    change_column :notifications, :type, :integer, using: 'type::integer'
  end
end
