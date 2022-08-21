defmodule Rubyforadmins2.Chapter do
  use GenServer
  alias Rubyforadmins2.Chapter

  defstruct id: nil, title: nil

  # Client
  def start_link(default) when is_list(default) do
    IO.inspect(default)
    #IO.inspect(__MODULE__)
    {:ok, pid} = GenServer.start_link(__MODULE__, default)
    #IO.inspect(pid)
    {:ok, pid}
  end

  def get_chapters() do
    paths = Path.absname("")
      |> Path.join("chapters")
      |> Path.join("**.heex")
      |> Path.wildcard()
    #IO.inspect(paths)
    for chapter <- paths do
      #get_id(id)
      %Chapter{id: get_id(chapter), title: get_title(chapter)}
    end
  end

  def get_title(chapter) do
    "x"
  end

  def get_id(chapter) do
    re = ~r/(\s*\d+\s*)\./u
    r = Regex.scan(re, chapter)
    r = for reg <- r do
      #IO.inspect(List.last(reg), label: "DUPA")
      List.last(reg)
    end
    #IO.inspect(r)
    r
  end

  # def push(pid, element) do
  #   GenServer.cast(pid, {:push, element})
  # end

  # def pop(pid) do
  #   GenServer.call(pid, :pop)
  # end

  # Server (callbacks)

  @impl true
  def init(stack) do
    {:ok, stack}
  end

  # @impl true
  # def handle_call(:pop, _from, [head | tail]) do
  #   {:reply, head, tail}
  # end

  # @impl true
  # def handle_cast({:push, element}, state) do
  #   {:noreply, [element | state]}
  # end

end
