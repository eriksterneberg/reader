use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or you later on).
config :reader, Reader.Endpoint,
  secret_key_base: "ZdW9pJdFVpWUy79Eby1Mu6dT7V0B84m5iPldieRMz0cGR/ZvlNACpH6CB/nQ6KkG"

# Configure your database
config :reader, Reader.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "reader_prod",
  pool_size: 20
