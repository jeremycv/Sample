# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_skills_session',
  :secret      => '8b1ea8ff76bfab210cfa6879c6bdefc7ebec45cd32eb4453e0ba534024865481e2d83a629aba3426710205e14c33fb5d907366df3152d34359cef8b719fd15da'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
