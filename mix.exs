defmodule CustomBase.Mixfile do
  use Mix.Project

  @version "0.2.1"
  @github "https://github.com/igas/custom_base"

  def project do
    [app: :custom_base,
     version: @version,
     elixir: "~> 1.0",
     name: "CustomBase",
     description: description(),
     package: package(),
     source_url: @github,
     docs: [extras: ["README.md"],
            main: "README",
            source_ref: "v#{@version}",
            source_url: @github],
     deps: deps()]
  end

  def application, do: []

  defp deps do
    [{:ex_doc, "~> 0.11", only: :dev},
     {:earmark, "~> 0.2", only: :dev}]
  end

  defp description do
    "Allow you to make custom base conversion in Elixir."
  end

  defp package do
    [maintainers: ["Igor Kapkov"],
     files: ["lib", "mix.exs", "README.md", "LICENSE"],
     licenses: ["MIT"],
     links: %{"Github" => @github}]
  end
end
