defmodule Chess.Piece do
  def create(table, piece_type, position, _owner) do
    cell = get_cell(table, position)
    piece = get_module(piece_type)
    representation = piece.get_representation
    new_piece = Chess.Cell.set_piece(cell, representation)
    new_table = put_piece_on_table(table, position, new_piece)
    new_table
  end

  def get_cell(table, position) do
    [col, row] = split_position(position)

    row_table = Map.get(table, row)
    cell = Map.get(row_table, col)

    cell
  end

  def put_piece_on_table(table, position, piece) do
    [col, row] = split_position(position)

    row_table = Map.get(table, row)
    # cell = Map.get(row_table, col)

    new_row = Map.put(row_table, col, piece)
    new_table = Map.put(table, row, new_row)

    new_table
  end

  def get_module(piece_type) do
    case piece_type do
      "Peao" -> Chess.Piece.Peao
      "Torre" -> Chess.Piece.Torre
      "Bispo" -> Chess.Piece.Bispo
      "Cavalo" -> Chess.Piece.Cavalo
      "Dama" -> Chess.Piece.Dama
      "Rei" -> Chess.Piece.Rei
    end
  end

  def split_position(position) do
    [_, col, row, _] = position |> String.split("")

    [
      String.to_atom(col),
      String.to_atom(row)
    ]
  end
end
