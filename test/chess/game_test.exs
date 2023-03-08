defmodule Chess.GameTest do
  use Chess.DataCase
  alias Chess.Game

  describe "create_table" do
    test "Gera o tabuleiro" do
      response = Game.create_table()

      expected_response = %{
        "1": %{
          A: %Chess.Cell{can_move: false, name: "A1", owner: nil, piece: nil},
          B: %Chess.Cell{can_move: false, name: "B1", owner: nil, piece: nil},
          C: %Chess.Cell{can_move: false, name: "C1", owner: nil, piece: nil},
          D: %Chess.Cell{can_move: false, name: "D1", owner: nil, piece: nil},
          E: %Chess.Cell{can_move: false, name: "E1", owner: nil, piece: nil},
          F: %Chess.Cell{can_move: false, name: "F1", owner: nil, piece: nil},
          G: %Chess.Cell{can_move: false, name: "G1", owner: nil, piece: nil},
          H: %Chess.Cell{can_move: false, name: "H1", owner: nil, piece: nil}
        },
        "2": %{
          A: %Chess.Cell{can_move: false, name: "A2", owner: nil, piece: nil},
          B: %Chess.Cell{can_move: false, name: "B2", owner: nil, piece: nil},
          C: %Chess.Cell{can_move: false, name: "C2", owner: nil, piece: nil},
          D: %Chess.Cell{can_move: false, name: "D2", owner: nil, piece: nil},
          E: %Chess.Cell{can_move: false, name: "E2", owner: nil, piece: nil},
          F: %Chess.Cell{can_move: false, name: "F2", owner: nil, piece: nil},
          G: %Chess.Cell{can_move: false, name: "G2", owner: nil, piece: nil},
          H: %Chess.Cell{can_move: false, name: "H2", owner: nil, piece: nil}
        },
        "3": %{
          A: %Chess.Cell{can_move: false, name: "A3", owner: nil, piece: nil},
          B: %Chess.Cell{can_move: false, name: "B3", owner: nil, piece: nil},
          C: %Chess.Cell{can_move: false, name: "C3", owner: nil, piece: nil},
          D: %Chess.Cell{can_move: false, name: "D3", owner: nil, piece: nil},
          E: %Chess.Cell{can_move: false, name: "E3", owner: nil, piece: nil},
          F: %Chess.Cell{can_move: false, name: "F3", owner: nil, piece: nil},
          G: %Chess.Cell{can_move: false, name: "G3", owner: nil, piece: nil},
          H: %Chess.Cell{can_move: false, name: "H3", owner: nil, piece: nil}
        },
        "4": %{
          A: %Chess.Cell{can_move: false, name: "A4", owner: nil, piece: nil},
          B: %Chess.Cell{can_move: false, name: "B4", owner: nil, piece: nil},
          C: %Chess.Cell{can_move: false, name: "C4", owner: nil, piece: nil},
          D: %Chess.Cell{can_move: false, name: "D4", owner: nil, piece: nil},
          E: %Chess.Cell{can_move: false, name: "E4", owner: nil, piece: nil},
          F: %Chess.Cell{can_move: false, name: "F4", owner: nil, piece: nil},
          G: %Chess.Cell{can_move: false, name: "G4", owner: nil, piece: nil},
          H: %Chess.Cell{can_move: false, name: "H4", owner: nil, piece: nil}
        },
        "5": %{
          A: %Chess.Cell{can_move: false, name: "A5", owner: nil, piece: nil},
          B: %Chess.Cell{can_move: false, name: "B5", owner: nil, piece: nil},
          C: %Chess.Cell{can_move: false, name: "C5", owner: nil, piece: nil},
          D: %Chess.Cell{can_move: false, name: "D5", owner: nil, piece: nil},
          E: %Chess.Cell{can_move: false, name: "E5", owner: nil, piece: nil},
          F: %Chess.Cell{can_move: false, name: "F5", owner: nil, piece: nil},
          G: %Chess.Cell{can_move: false, name: "G5", owner: nil, piece: nil},
          H: %Chess.Cell{can_move: false, name: "H5", owner: nil, piece: nil}
        },
        "6": %{
          A: %Chess.Cell{can_move: false, name: "A6", owner: nil, piece: nil},
          B: %Chess.Cell{can_move: false, name: "B6", owner: nil, piece: nil},
          C: %Chess.Cell{can_move: false, name: "C6", owner: nil, piece: nil},
          D: %Chess.Cell{can_move: false, name: "D6", owner: nil, piece: nil},
          E: %Chess.Cell{can_move: false, name: "E6", owner: nil, piece: nil},
          F: %Chess.Cell{can_move: false, name: "F6", owner: nil, piece: nil},
          G: %Chess.Cell{can_move: false, name: "G6", owner: nil, piece: nil},
          H: %Chess.Cell{can_move: false, name: "H6", owner: nil, piece: nil}
        },
        "7": %{
          A: %Chess.Cell{can_move: false, name: "A7", owner: nil, piece: nil},
          B: %Chess.Cell{can_move: false, name: "B7", owner: nil, piece: nil},
          C: %Chess.Cell{can_move: false, name: "C7", owner: nil, piece: nil},
          D: %Chess.Cell{can_move: false, name: "D7", owner: nil, piece: nil},
          E: %Chess.Cell{can_move: false, name: "E7", owner: nil, piece: nil},
          F: %Chess.Cell{can_move: false, name: "F7", owner: nil, piece: nil},
          G: %Chess.Cell{can_move: false, name: "G7", owner: nil, piece: nil},
          H: %Chess.Cell{can_move: false, name: "H7", owner: nil, piece: nil}
        },
        "8": %{
          A: %Chess.Cell{can_move: false, name: "A8", owner: nil, piece: nil},
          B: %Chess.Cell{can_move: false, name: "B8", owner: nil, piece: nil},
          C: %Chess.Cell{can_move: false, name: "C8", owner: nil, piece: nil},
          D: %Chess.Cell{can_move: false, name: "D8", owner: nil, piece: nil},
          E: %Chess.Cell{can_move: false, name: "E8", owner: nil, piece: nil},
          F: %Chess.Cell{can_move: false, name: "F8", owner: nil, piece: nil},
          G: %Chess.Cell{can_move: false, name: "G8", owner: nil, piece: nil},
          H: %Chess.Cell{can_move: false, name: "H8", owner: nil, piece: nil}
        }
      }

      assert response == expected_response
    end

    test "draw terminal table" do
      response =
        Game.create_table()
        |> Game.print()

      expected_response =
        "" <>
          "8 |   |   |   |   |   |   |   |   |\n" <>
          "7 |   |   |   |   |   |   |   |   |\n" <>
          "6 |   |   |   |   |   |   |   |   |\n" <>
          "5 |   |   |   |   |   |   |   |   |\n" <>
          "4 |   |   |   |   |   |   |   |   |\n" <>
          "3 |   |   |   |   |   |   |   |   |\n" <>
          "2 |   |   |   |   |   |   |   |   |\n" <>
          "1 |   |   |   |   |   |   |   |   |\n" <>
          "    A   B   C   D   E   F   G   H"

      assert response == expected_response
    end

    test "draw populate table" do
      response =
        Game.create_table()
        |> IO.inspect()
        |> Game.popular()
        |> IO.inspect()
        |> Game.print()
        |> IO.inspect()

      # "8 | T | C | B | D | R | B | C | T |\n" <>
      expected_response =
        "" <>
          "8 |   |   |   |   |   |   |   |   |\n" <>
          "7 | P | P | P | P | P | P | P | P |\n" <>
          "6 |   |   |   |   |   |   |   |   |\n" <>
          "5 |   |   |   |   |   |   |   |   |\n" <>
          "4 |   |   |   |   |   |   |   |   |\n" <>
          "3 |   |   |   |   |   |   |   |   |\n" <>
          "2 | P | P | P | P | P | P | P | P |\n" <>
          "1 |   |   |   |   |   |   |   |   |\n" <>
          "    A   B   C   D   E   F   G   H"

      assert response == expected_response
    end
  end
end
