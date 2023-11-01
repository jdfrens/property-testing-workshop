defmodule PropertyTesting.MixProject do
  use Mix.Project

  def project do
    [
      app: :property_testing,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {PropertyTesting.Application, []}
    ]
  end

  defp deps do
    [
      {:ecto, "~> 3.11"},
      {:stream_data, "~> 0.5", only: [:dev, :test]}
    ]
  end
end
