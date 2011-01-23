class HoboMigration4 < ActiveRecord::Migration
  def self.up
    drop_table :contactos

    add_column :emails, :user_id, :integer

    add_column :users, :telefono, :string
    add_column :users, :fax, :string
    add_column :users, :notas, :text

    add_column :documentos, :user_id, :integer
    remove_column :documentos, :contacto_id

    add_index :emails, [:user_id]

    remove_index :documentos, :name => :index_documentos_on_contacto_id rescue ActiveRecord::StatementInvalid
    add_index :documentos, [:user_id]
  end

  def self.down
    remove_column :emails, :user_id

    remove_column :users, :telefono
    remove_column :users, :fax
    remove_column :users, :notas

    remove_column :documentos, :user_id
    add_column :documentos, :contacto_id, :integer

    create_table "contactos", :force => true do |t|
      t.string   "nombre"
      t.string   "email"
      t.string   "telefono"
      t.string   "fax"
      t.text     "notas"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    remove_index :emails, :name => :index_emails_on_user_id rescue ActiveRecord::StatementInvalid

    remove_index :documentos, :name => :index_documentos_on_user_id rescue ActiveRecord::StatementInvalid
    add_index :documentos, [:contacto_id]
  end
end
