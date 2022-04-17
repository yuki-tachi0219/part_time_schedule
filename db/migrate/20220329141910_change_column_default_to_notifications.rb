class ChangeColumnDefaultToNotifications < ActiveRecord::Migration[6.1]
  def change
    change_column_default :notifications, :type, from: nil, to: "0"
    change_column_default :notifications, :checked, from: nil, to: false
  end
end
