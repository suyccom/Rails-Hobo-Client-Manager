class HoboMigration8 < ActiveRecord::Migration
  def self.up
    rename_column :emails, :user_id, :emisor_id
    add_column :emails, :receptor_id, :integer

    remove_index :emails, :name => :index_emails_on_user_id rescue ActiveRecord::StatementInvalid
    add_index :emails, [:emisor_id]
    add_index :emails, [:receptor_id]

    remove_index :users, :name => :index_users_on_state rescue ActiveRecord::StatementInvalid
  end

  def self.down
    rename_column :emails, :emisor_id, :user_id
    remove_column :emails, :receptor_id

    remove_index :emails, :name => :index_emails_on_emisor_id rescue ActiveRecord::StatementInvalid
    remove_index :emails, :name => :index_emails_on_receptor_id rescue ActiveRecord::StatementInvalid
    add_index :emails, [:user_id]

    add_index :users, [:estado], :name => 'index_users_on_state'
  end
end
