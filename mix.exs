defmodule Knigge.MixProject do
  use Mix.Project

  @repo "https://github.com/fschoenfeldt/knigge"

  def project do
    [
      app: :knigge,
      config_path: "config/config.exs",
      elixir: ">= 1.18.0 and < 2.0.0",
      elixirc_paths: elixirc_paths(Mix.env()),
      test_coverage: [tool: ExCoveralls],
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps(),

      # Deps
      dialyzer: dialyzer(),

      # Docs
      name: "Knigge",
      source_url: @repo,
      homepage_url: @repo,

      # Hex
      description: description(),
      docs: docs(),
      package: package(),
      version: version()
    ]
  end

  def cli do
    [
      # https://github.com/lpil/mix-test.watch?tab=readme-ov-file#usage
      # https://hexdocs.pm/ex_check/readme.html#duplicate-builds
      preferred_envs: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test,
        "coveralls.github": :test,
        check: :test,
        credo: :test,
        dialyzer: :test,
        docs: :test,
        format: :test,
        "test.watch": :test
      ]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    []
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:bunt, "~> 1.0", runtime: false},

      # No Runtime
      {:ex_check, "~> 0.16.0", only: [:dev, :test], runtime: false},
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.4", only: [:dev, :test], runtime: false},
      {:ex_doc, ">= 0.0.0", only: [:dev, :test], runtime: false},

      # Test
      {:excoveralls, "~> 0.13", only: :test},
      {:mox, "~> 1.0", only: :test}
    ]
  end

  defp dialyzer do
    [
      plt_add_deps: :app_tree,
      plt_add_apps: [:mix, :logger, :bunt],
      plt_core_path: "_build/plt_core",
      plt_file: {:no_warn, "_build/plts/dialyzer.plt"}
    ]
  end

  #######
  # Hex #
  #######

  def description do
    "An opinionated way of dealing with behaviours."
  end

  @extras Path.wildcard("pages/**/*.md")
  def docs do
    [
      main: "Knigge",
      source_ref: "v#{version()}",
      source_url: @repo,
      extras: @extras,
      groups_for_modules: [
        "Overview & Configuration": [
          Knigge,
          Knigge.Options
        ],
        "Code Generation": [
          Knigge.Behaviour,
          Knigge.Code,
          Knigge.Implementation
        ],
        Verification: [
          Knigge.Verification
        ]
      ]
    ]
  end

  def package do
    [
      files: ["lib", "mix.exs", "CHANGELOG*", "LICENSE*", "README*", "version"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => @repo
      },
      maintainers: [
        "Alex Wolf <craft@alexocode.dev>",
        "Frederik Schönfeldt <frederikschoenfeldt@gmail.com>"
      ]
    ]
  end

  @version_file "version"
  def version do
    cond do
      File.exists?(@version_file) ->
        @version_file
        |> File.read!()
        |> String.trim()

      System.get_env("REQUIRE_VERSION_FILE") == "true" ->
        exit("Version file (`#{@version_file}`) doesn't exist but is required!")

      true ->
        "0.0.0-dev"
    end
  end
end
