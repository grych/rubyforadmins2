import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :rubyforadmins2, Rubyforadmins2Web.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "T/UUEFww1ycaRo9NmBZ/slA85D/HuKTqAp4FzRkA4/vQ+vS2wD7L9pC8MOEgREb5",
  server: false

# In test we don't send emails.
config :rubyforadmins2, Rubyforadmins2.Mailer,
  adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
