"./input.txt"
|> File.read!()
|> String.split("\n", trim: true)
|> Enum.reduce(
  [[], []],
  fn x, [l1, l2] ->
    [n1, n2] =
      x
      |> String.split(" ", trim: true)
      |> Enum.map(fn y ->
        String.to_integer(y)
      end)

    [[n1 | l1], [n2 | l2]]
  end
)
|> Enum.map(fn x -> Enum.sort(x) end)
|> Enum.zip()
|> Enum.reduce(0, fn {n1, n2}, t ->
  t + abs(n1 - n2)
end)
|> IO.inspect()
