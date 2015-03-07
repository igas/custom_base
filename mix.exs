defmodule CustomBase.Mixfile do
  use Mix.Project

  def project do
    [app: :custom_base,
     version: "0.1.0",
     elixir: "~> 1.0",
     name: "CustomBase",
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
end
