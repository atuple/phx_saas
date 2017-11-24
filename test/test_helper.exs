defmodule PhxSaas.TestPostgresRepo do
  use Ecto.Repo, otp_app: :PhxSaas, adapter: Ecto.Adapters.Postgres, pool: Ecto.Adapters.SQL.Sandbox
end

Code.compiler_options(ignore_module_conflict: true)

Mix.Task.run "ecto.drop", ["quiet", "-r", "PhxSaas.TestPostgresRepo"]
Mix.Task.run "ecto.create", ["quiet", "-r", "PhxSaas.TestPostgresRepo"]

PhxSaas.TestPostgresRepo.start_link

ExUnit.start()

Ecto.Adapters.SQL.Sandbox.mode(PhxSaas.TestPostgresRepo, :manual)
