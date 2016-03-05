defmodule AbsintheRelay.Mixfile do
  use Mix.Project

  @version "0.0.1"

  def project do
    [app: :absinthe_relay,
     version: @version,
     elixir: "~> 1.2",
     elixirc_paths: elixirc_paths(Mix.env),
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     package: package,
     docs: [source_ref: "v#{@version}", main: "Absinthe.Relay"],
     deps: deps]
  end

  defp package do
    [description: "Relay framework support for Absinthe",
     files: ["lib", "mix.exs", "README*"],
     maintainers: ["Bruce Williams"],
     licenses: ["BSD"],
     links: %{github: "https://github.com/CargoSense/absinthe_relay"}]
  end

  def application do
    [applications: [:logger, :absinthe]]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  defp deps do
    [
      {:absinthe, github: "absinthe-graphql/absinthe", branch: "macro-extensibility"},
      {:poison, ">= 0.0.0", only: [:dev, :test]},
      {:ex_doc, "~> 0.11.0", only: :dev},
      {:earmark, "~> 0.1.19", only: :dev},
      {:ex_spec, "~> 1.0.0", only: :test}
    ]
  end

end