defmodule Mandrag.Helm do
  @moduledoc """
  Documentation for Mandrag.Helm
  """
  def context do
    case Application.get_env(:mandrag, :k8s_context) do
      nil -> ""
      context -> "--kube-context #{context}"
    end
  end

  def run(args), do: Mix.Shell.IO.cmd("helm #{context()} #{args}")
end
