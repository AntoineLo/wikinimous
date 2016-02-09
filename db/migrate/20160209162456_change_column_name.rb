class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :articles, :user, :user_id
  end
end
