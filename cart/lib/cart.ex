defmodule Cart do
  def add([],{}) do
   []
 end
 def add(alist, action) do
   alist ++ [action]
 end

 def show([]) do
   []
 end

 def unique([]) do
  []
 end
def unique(alist) do
Enum.map(alist, fn {_, item} -> item end) |>
Enum.uniq

end

end
