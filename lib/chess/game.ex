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

  def reduce_table(start, callback) do
    Enum.reduce(cols(), start, fn col, table ->
      Enum.reduce(rows(), table, fn row, acc ->
        callback.(col, row, acc)
      end)
    end)
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
            piece: _piece,
            can_move: _can_move,
            owner: _owner,
            name: _name
          } = col

          # col_acc <> "#{name} |"
          col_acc <> "   |"
        end)

      "#{row_acc}#{str_ini}#{str_row}\n"
    end)
    |> Kernel.<>("    A   B   C   D   E   F   G   H")
  end
end
