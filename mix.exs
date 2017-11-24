defmodule PhxSaas.Mixfile do
  use Mix.Project

  def project do
    [
      app: :phx_saas,
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      description: "SaaS Library for Ecto applications using Postgres or Mysql",
      package: [
        links: %{"Github" => "https://github.com/atuple/phx_saas"},
        maintainers: ["sai"],
        licenses: ["MIT"]
      ],
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :ecto]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto, ">= 2.2.6"},
      {:mariaex, ">= 0.8.3", optional: true},
      {:postgrex, ">= 0.11.0", optional: true},
      {:ex_doc, ">= 0.0.0", only: :dev}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end
  
end
