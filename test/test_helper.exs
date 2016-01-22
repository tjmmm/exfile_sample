ExUnit.start

Mix.Task.run "ecto.create", ~w(-r ExfileSample.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r ExfileSample.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(ExfileSample.Repo)

