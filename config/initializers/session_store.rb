# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_sgeidabe_session',
  :secret      => 'b059cda6257cd259c3dd9bb6c3a2ebb130f7ae24c08e2ff90f9e20efec74386022a639a2fe947b1033071bad64c019f690af6bdca75ee3d2e500a47143f54e41'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
