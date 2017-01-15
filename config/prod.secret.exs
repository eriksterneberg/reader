use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or you later on).
config :elm_articles, ElmArticles.Endpoint,
  secret_key_base: "VXrq5W+6rk7zAAbGid/Co+1YwdQWENJbsXSUUEQrZs/EZqL432PllBDn2ZJnL9X7"

# Configure your database
config :elm_articles, ElmArticles.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "elm_articles_prod",
  pool_size: 20
