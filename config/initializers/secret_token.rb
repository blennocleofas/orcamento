# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Orcamento::Application.config.secret_key_base = ENV['SESSION_KEY'] || 'd5a7e1c89cfc99098bbf5327e216d2937781ae72ff6b2b999641c0820714192c386345dc4c95d2418dfddbfa051dfdef34640bc8ad5650b9c47bb10751a59050
'
