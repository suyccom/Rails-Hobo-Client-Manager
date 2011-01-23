class HoboMigration7 < ActiveRecord::Migration
  def self.up
    add_column :users, :logo_file_name, :string
    add_column :users, :logo_content_type, :string
    add_column :users, :logo_file_size, :integer
    add_column :users, :logo_updated_at, :datetime

    remove_index :users, :name => :index_users_on_state rescue ActiveRecord::StatementInvalid
  end

  def self.down
    remove_column :users, :logo_file_name
    remove_column :users, :logo_content_type
    remove_column :users, :logo_file_size
    remove_column :users, :logo_updated_at

    add_index :users, [:estado], :name => 'index_users_on_state'
  end
end
