# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_internship_session',
  :secret      => '7d814b50fb0a9cc5519c05ab203a1dc3be1358e01b763b35ee3c95fb0f7c327f697aece5cfcc93abe39e9169e648d8ec16e4879142b80500f39c55b96c27ecc7'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
