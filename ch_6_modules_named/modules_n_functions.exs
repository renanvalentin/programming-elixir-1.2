defmodule ModulesNFunFun do
  def decimal_to_string(n), do: :io_lib.format("~.2f~n", [n]) 

  def get_env, do: System.get_env

  def ext, do: Path.extname("./modules_n_functions.exs")

  def cwd, do: System.cwd

  def cmd, do: System.cmd("whoami", [])
end
