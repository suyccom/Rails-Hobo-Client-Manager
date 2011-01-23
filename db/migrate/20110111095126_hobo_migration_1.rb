class HoboMigration1 < ActiveRecord::Migration
  def self.up
    create_table :contactos do |t|
      t.string   :nombre
      t.string   :email
      t.string   :telefono
      t.string   :fax
      t.text     :notas
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :users do |t|
      t.string   :crypted_password, :limit => 40
      t.string   :salt, :limit => 40
      t.string   :remember_token
      t.datetime :remember_token_expires_at
      t.string   :name
      t.string   :email_address
      t.boolean  :administrator, :default => false
      t.datetime :created_at
      t.datetime :updated_at
      t.string   :state, :default => "active"
      t.datetime :key_timestamp
    end
    add_index :users, [:state]

    create_table :documentos do |t|
      t.string   :nombre
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :contacto_id
      t.string   :adjunto_file_name
      t.string   :adjunto_content_type
      t.integer  :adjunto_file_size
      t.datetime :adjunto_updated_at
    end
    add_index :documentos, [:contacto_id]
  end

  def self.down
    drop_table :contactos
    drop_table :users
    drop_table :documentos
  end
end
