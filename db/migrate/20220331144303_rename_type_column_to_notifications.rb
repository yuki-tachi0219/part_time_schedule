class RenameTypeColumnToNotifications < ActiveRecord::Migration[6.1]
  def change
    rename_column :notifications, :type, :action
  end
end
