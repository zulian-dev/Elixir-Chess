defmodule Chess.Cell do
  defstruct piece: nil, can_move: false, owner: nil, name: ""

  def create(name, piece, can_move, owner)
      when is_bitstring(name) and
             (is_bitstring(piece) or is_nil(piece)) and
             is_boolean(can_move) and
             (is_number(owner) or is_nil(owner)) do
    {:ok,
     %__MODULE__{
       name: name,
       piece: piece,
       can_move: can_move,
       owner: owner
     }}
  end

  def create(_name, _piece, _can_move, _owner) do
    {:error, "invalid args"}
  end

  def create(%{
        name: name,
        piece: piece,
        can_move: can_move,
        owner: owner
      }) do
    create(name, piece, can_move, owner)
  end
end
