defmodule Day2 do
  def navigate(steps) do
    {x, y} = for step <- steps, reduce: {0,0} do
      acc -> move(step, acc)
    end

    x * y
  end

  def move("forward " <> delta_x, {x,y}) do
    {x + String.to_integer(delta_x), y}
  end

  def move("up " <> delta_y, {x,y}) do
    {x, y - String.to_integer(delta_y)}
  end

  def move("down " <> delta_y, {x,y}) do
    {x, y + String.to_integer(delta_y)}
  end

  def navigate_with_aim(steps) do
    {x,y,_aim} = for step <- steps, reduce: {0,0,0} do
      acc -> move_with_aim(step, acc)
    end
    x * y
  end

  def move_with_aim("forward " <> delta_x, {x,y,aim}) do
    units = String.to_integer(delta_x)
    {x + units , y + (units * aim),aim}
  end

  def move_with_aim("up " <> delta_y, {x,y,aim}) do
    units = String.to_integer(delta_y)
    {x, y, aim - units}
  end

  def move_with_aim("down " <> delta_y, {x,y,aim}) do
    units = String.to_integer(delta_y)
    {x, y, aim + units}
  end
end
