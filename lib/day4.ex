defmodule Day4.Board do
  defstruct all_numbers: [], rows: [], cols: [], drawn_numbers: []
end

defmodule Day4 do
  alias Day4.Board

  def parse_input(path) do
    [drawn_numbers_str | board_strs] =
      File.read!(path || "inputs/day4.txt")
      |> String.split("\n\n", trim: true)

    drawn_numbers =
      drawn_numbers_str
      |> String.split(",", trim: true)
      |> Enum.map(&String.to_integer/1)

    boards = build_boards(board_strs)

    {drawn_numbers, boards}
  end

  def play(path) do
    {drawn_numbers, boards} = parse_input(path)

    winner = drawn_numbers
    |> Enum.reduce_while(boards, fn x, acc ->
      case update_and_select_winner(acc, x) do
        {new_boards, nil} -> {:cont, new_boards}
        {_, winner} -> {:halt, winner}
      end
    end)

    unmarked  = Enum.sum(winner.all_numbers -- winner.drawn_numbers)

    unmarked * hd(winner.drawn_numbers)
  end

  def build_boards(board_strs) do
    board_strs
    |> Enum.map(fn board_str ->
      rows =
        String.split(board_str, "\n", trim: true)
        |> Enum.map(fn board_row_str ->
          board_row_str
          |> String.split(" ", trim: true)
          |> Enum.map(&String.to_integer/1)
        end)

      cols = Enum.zip(rows) |> Enum.map(&Tuple.to_list/1)

      all_numbers = List.flatten(rows)

      %Board{all_numbers: all_numbers, rows: rows, cols: cols}
    end)
  end

  def update_and_select_winner(boards, draw_number) do
    new_boards =
      boards
      |> Enum.map(&mark_number(&1, draw_number))

    winner_board =
      new_boards
      |> Enum.filter(fn board ->
        Enum.any?(board.rows, & &1 == []) ||
        Enum.any?(board.cols, & &1 == [])
      end)
      |> List.first()

    {new_boards, winner_board}
  end

  def mark_number(board, draw_number) do
    %{
      board
      | rows: Enum.map(board.rows, &List.delete(&1, draw_number)),
        cols: Enum.map(board.cols, &List.delete(&1, draw_number)),
        drawn_numbers: [draw_number | board.drawn_numbers]
    }
  end
end
