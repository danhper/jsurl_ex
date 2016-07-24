defmodule JsurlEx.Mixfile do
  use Mix.Project

  @version "0.1.0"

  def project do
    [app: :jsurl_ex,
     version: @version,
     elixir: "~> 1.1",
     description: "Package to work with the jsurl format",
     source_url: "https://github.com/tuvistavie/jsurl_ex",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     package: package,
     deps: deps(),
     docs: [source_ref: "#{@version}", extras: ["README.md"], main: "readme"]]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [{:earmark, "~> 0.2", only: :dev},
     {:ex_doc,  "~> 0.11", only: :dev}]
  end

  defp package do
    [
      maintainers: ["Daniel Perez"],
      files: ["lib", "mix.exs", "README.md"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/tuvistavie/jsurl_ex",
        "Docs" => "http://hexdocs.pm/jsurl_ex/"
      }
    ]
  end
end
