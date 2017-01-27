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

 def show(alist) do
   uniqs = unique(alist)
   Enum.map(uniqs,fn x -> {counter(alist,x), x} end )
 end

  def counter(alist, item) do
    Enum.count(alist, fn action -> action == {:+, item} end) - Enum.count(alist, fn action -> action == {:-, item} end)


  end

 def unique([]) do
  []
 end
def unique(alist) do
Enum.map(alist, fn {_, item} -> item end) |>
Enum.uniq

end

end
