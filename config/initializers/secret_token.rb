# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Amazon::Application.config.secret_key_base = ENV["SECRET_KEY_BASE"] || "d04c55d375ca9e392a455b639cf9bff92f6f236eee1fc23a9fe26f3288868c8e408aba65b23f7e4fd6d5be4bb95637ea12eb4713a729ff45a4871efa5f085601"
