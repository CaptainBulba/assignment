import Config

config :assignment, Assignment.Repo,
  database: "assignment_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

config :assignment, ecto_repos: [Assignment.Repo]
