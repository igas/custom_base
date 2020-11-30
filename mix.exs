defmodule CustomBase.Mixfile do
  use Mix.Project

  @version "0.2.1"
  @github "https://github.com/igas/custom_base"

  def project do
    [
      app: :custom_base,
      version: @version,
      elixir: "~> 1.0",
      name: "CustomBase",
      description: description(),
      package: package(),
      source_url: @github,
      docs: docs(),
      deps: deps()
    ]
  end

  def application, do: []

  defp docs do
    [
      extras: ["README.md"],
      main: "readme",
      name: "custom_base",
      canonical: "https://hexdocs.pm/custom_base",
      source_ref: "v#{@version}",
      source_url: @github
    ]
  end

  defp deps do
    [
      {:ex_doc, "~> 0.15", only: :dev},
      {:earmark, "~> 1.2", only: :dev}
    ]
  end

  defp description do
    "Allow you to make custom base conversion in Elixir."
  end

  defp package do
    [
      maintainers: ["Igor Kapkov"],
      files: ["lib", "mix.exs", "README.md", "LICENSE"],
      licenses: ["MIT"],
      links: %{"Github" => @github}
    ]
  end
end
