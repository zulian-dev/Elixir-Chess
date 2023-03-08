defmodule Chess.Piece.Peao do
  def create(table, position, _owner) do
    [col, row] = split_position(position)

    # %{^col: %{^col: cell}} = table

    row_table = Map.get(table, row)
    cell = Map.get(row_table, col)

    # IO.inspect(">>>>>>>>>>>>>>>")
    # IO.inspect(cell)

    new_piece = Chess.Cell.set_piece(cell, "P")
    IO.inspect("new_piece")
    IO.inspect(new_piece)

    new_row = Map.put(row_table, col, new_piece)
    IO.inspect("new_row")
    IO.inspect(new_row)

    new_table = Map.put(table, row, new_row)
    IO.inspect("new_table")
    IO.inspect(new_table)

    new_table
    # Map.put(new_piece, )
  end

  def split_position(position) do
    [_, col, row, _] = position |> String.split("")

    [
      String.to_atom(col),
      String.to_atom(row)
    ]
  end
end
