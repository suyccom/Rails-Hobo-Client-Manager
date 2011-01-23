class HoboMigration6 < ActiveRecord::Migration
  def self.up
    add_column :users, :fecha_alta, :date
    add_column :users, :fecha_baja, :date

    remove_index :users, :name => :index_users_on_state rescue ActiveRecord::StatementInvalid
  end

  def self.down
    remove_column :users, :fecha_alta
    remove_column :users, :fecha_baja

    add_index :users, [:estado], :name => 'index_users_on_state'
  end
end
