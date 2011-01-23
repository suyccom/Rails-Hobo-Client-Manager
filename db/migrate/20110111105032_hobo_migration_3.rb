class HoboMigration3 < ActiveRecord::Migration
  def self.up
    create_table :emails do |t|
      t.string   :titulo
      t.text     :contenido
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :emails
  end
end
