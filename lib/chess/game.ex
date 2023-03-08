defmodule Chess.Game do
  @cols [
    :A,
    :B,
    :C,
    :D,
    :E,
    :F,
    :G,
    :H
  ]

  @rows [
    :"1",
    :"2",
    :"3",
    :"4",
    :"5",
    :"6",
    :"7",
    :"8"
  ]

  def create_table do
    Enum.reduce(rows(), %{}, fn row, table ->
      row_content =
        Enum.reduce(cols(), %{}, fn col, acc ->
          name = cell_name(col, row)

          {:ok, col_content} =
            Chess.Cell.create(%{
              name: name,
              piece: nil,
              can_move: false,
              owner: nil
            })

          Map.put(acc, col, col_content)
        end)

      Map.put(table, row, row_content)
    end)
  end

  def popular(tabuleiro) do
    tabuleiro
    |> Chess.Piece.Peao.create("A2", 1)
    |> Chess.Piece.Peao.create("B2", 1)
    |> Chess.Piece.Peao.create("C2", 1)
    |> Chess.Piece.Peao.create("D2", 1)
    |> Chess.Piece.Peao.create("E2", 1)
    |> Chess.Piece.Peao.create("F2", 1)
    |> Chess.Piece.Peao.create("G2", 1)
    |> Chess.Piece.Peao.create("H2", 1)
    #
    |> Chess.Piece.Peao.create("A7", 2)
    |> Chess.Piece.Peao.create("B7", 2)
    |> Chess.Piece.Peao.create("C7", 2)
    |> Chess.Piece.Peao.create("D7", 2)
    |> Chess.Piece.Peao.create("E7", 2)
    |> Chess.Piece.Peao.create("F7", 2)
    |> Chess.Piece.Peao.create("G7", 2)
    |> Chess.Piece.Peao.create("H7", 2)
  end

  def possibilidades(tabuleiro, posicao) do
  end

  def cell_name(row, col) when is_atom(row), do: cell_name(Atom.to_string(row), col)
  def cell_name(row, col) when is_atom(col), do: cell_name(row, Atom.to_string(col))

  def cell_name(row, col) do
    (row <> col)
    |> String.upcase()
  end

  def cols, do: @cols
  def rows, do: @rows

  # ---
  def print(table) do
    array_table =
      table
      |> Map.to_list()
      |> Enum.map(fn {name, value} ->
        {name, Map.to_list(value)}
      end)
      |> Enum.reverse()

    Enum.reduce(array_table, "", fn {row_name, rows}, row_acc ->
      str_ini = to_string(row_name) <> " |"

      str_row =
        Enum.reduce(rows, "", fn {_col_name, col}, col_acc ->
          %Chess.Cell{
            piece: piece,
            can_move: _can_move,
            owner: _owner,
            name: name
          } = col

          col_acc <> " #{(piece && piece) || " "} |"
          # col_acc <> "   |"
        end)

      "#{row_acc}#{str_ini}#{str_row}\n"
    end)
    |> Kernel.<>("    A   B   C   D   E   F   G   H")
  end
end
