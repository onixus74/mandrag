# Mandrag

[![](https://github.com/cschiewek/mandrag/workflows/Continuous%20Integration/badge.svg)](https://github.com/cschiewek/mandrag/actions?workflow=Continuous+Integration)

Zero Confing Elixir Deployments to [Kubernetes](https://kubernetes.io/) via [Helm](https://helm.sh/)

## Requirements
- Elixir 1.9 (See the older v0.7.x tags for versions that support > 1.9 via Distillery)
- Mandrag expects that you have docker, kubectl and helm binaries installed and configured.
- Currently, It also expects that you have a helm chart in the `chart` directory.


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `mandrag` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:mandrag, "~> 0.8.0"}
  ]
end
```

## Configure

Mandrag doesn't require configuation, it'll introspect the parent mix config to derive configuration, and use it's own built-in [Dockerfile](https://github.com/cschiewek/mandrag/blob/master/priv/Dockerfile), but you can override those values as seen below.

```elixir
config :mandrag,
  # The name of the app and release. Defaults to the :app key in the parent mix project.
  app: :app_name,
  # The docker repo to push to. Defaults to `app_name`.
  docker_repo: "docker_user_name/app_name",
  # The path to the Dockerfile to be used.  Defaults to the Dockerfile inside this package.
  dockerfile_path: "Dockerfile",
  # A map of values that are translated to `--build-arg` arguments.
  docker_build_args: %{key: "value"}
  # The kubernetes context, defaults to your current context
  k8s_context: "docker-for-desktop"
```

TODO for 1.0:
- Add default Helm chart for zero conifg standup.  (or mabye just create a [draft](https://draft.sh/) pack?)

TODO for 1.x:
- Enable clustering for deploys with multiple replicas

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/mandrag](https://hexdocs.pm/mandrag).
