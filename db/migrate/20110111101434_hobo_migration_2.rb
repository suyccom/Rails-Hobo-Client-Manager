class HoboMigration2 < ActiveRecord::Migration
  def self.up
    remove_column :documentos, :nombre
  end

  def self.down
    add_column :documentos, :nombre, :string
  end
end
