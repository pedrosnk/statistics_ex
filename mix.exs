defmodule StatisticsEx.Mixfile do
  use Mix.Project

  def project do
    [
      app: :statistics_ex,
      version: "0.0.1",
      elixir: "~> 1.4",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      description: "A small library to make some statitics calculations",
      package: package(),
      deps: deps(),
    ]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    [{:ex_doc, ">= 0.0.0", only: :dev}]
  end

  defp package do
    [
      files: ~w(lib mix.exs README.md),
      licenses: ["MIT"],
      maintainers: ["Pedro Medeiros"],
      links: %{"Github" => "https://github.com/pedrosnk/statistics_ex"},
    ]
  end
end
