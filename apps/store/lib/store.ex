defmodule Store do
  use GenServer

  @moduledoc """
  Documentation for `Store`.
  """

  @doc """
  Starts a GenServer with initial state.
  """
  def start_link(state) do
    GenServer.start_link(__MODULE__, state, name: :store)
  end

  def getEvents do
    GenServer.call(:store, {:getState})
  end

  def addEvent(event) do
    GenServer.cast(:store, {:add, event})
  end

  ######
  ###### Server
  ######

  def init(state) do
    {:ok, state}
  end

  def handle_call({:getState}, _from, state) do
    {:reply, state, state}
  end

  def handle_cast({:add, element}, state) do
    {:noreply, state ++ element}
  end
end
