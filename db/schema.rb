# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110122212245) do

  create_table "documentos", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "adjunto_file_name"
    t.string   "adjunto_content_type"
    t.integer  "adjunto_file_size"
    t.datetime "adjunto_updated_at"
    t.integer  "user_id"
    t.string   "fichero"
  end

  add_index "documentos", ["user_id"], :name => "index_documentos_on_user_id"

  create_table "emails", :force => true do |t|
    t.string   "titulo"
    t.text     "contenido"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "emisor_id"
    t.integer  "receptor_id"
  end

  add_index "emails", ["emisor_id"], :name => "index_emails_on_emisor_id"
  add_index "emails", ["emisor_id"], :name => "index_emails_on_user_id"
  add_index "emails", ["receptor_id"], :name => "index_emails_on_receptor_id"

  create_table "users", :force => true do |t|
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "name"
    t.string   "email_address"
    t.boolean  "administrator",                           :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "estado",                                  :default => "active"
    t.datetime "key_timestamp"
    t.string   "telefono"
    t.string   "fax"
    t.text     "notas"
    t.date     "fecha_alta"
    t.date     "fecha_baja"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  add_index "users", ["estado"], :name => "index_users_on_estado"
  add_index "users", ["estado"], :name => "index_users_on_state"

end
