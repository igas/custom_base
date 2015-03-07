defmodule CustomBase.Mixfile do
  use Mix.Project

  def project do
    [app: :custom_base,
     version: "0.1.0",
     elixir: "~> 1.0",
     name: "CustomBase",
     description: description,
     package: package,
     source_url: "https://github.com/igas/custom_base",
     docs: [readme: "README.md",
            main: "README"],
     deps: deps]
  end

  def application, do: []

  defp deps do
    [{:ex_doc, only: :dev},
     {:earmark, only: :dev}]
  end

  defp description do
    "Allow you to make custom base conversion in Elixir."
  end

  defp package do
    [contributors: ["Igor Kapkov"],
     files: ["lib", "mix.exs", "README.md"],
     links: %{"Github" => "https://github.com/igas/custom_base"}]
end
