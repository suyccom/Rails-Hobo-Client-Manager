class HoboMigration12 < ActiveRecord::Migration
  def self.up
    change_column :users, :estado, :string, :limit => 255, :default => "active"

    remove_index :emails, :name => :index_emails_on_user_id rescue ActiveRecord::StatementInvalid

    remove_index :users, :name => :index_users_on_state rescue ActiveRecord::StatementInvalid
  end

  def self.down
    change_column :users, :estado, :string, :default => "alta"

    add_index :emails, [:emisor_id], :name => 'index_emails_on_user_id'

    add_index :users, [:estado], :name => 'index_users_on_state'
  end
end
