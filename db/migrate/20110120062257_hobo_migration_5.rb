class HoboMigration5 < ActiveRecord::Migration
  def self.up
    rename_column :users, :state, :estado
    change_column :users, :estado, :string, :limit => 255, :default => "alta"

    remove_index :users, :name => :index_users_on_state rescue ActiveRecord::StatementInvalid
    add_index :users, [:estado]
  end

  def self.down
    rename_column :users, :estado, :state
    change_column :users, :state, :string, :default => "active"

    remove_index :users, :name => :index_users_on_estado rescue ActiveRecord::StatementInvalid
    add_index :users, [:state]
  end
end
