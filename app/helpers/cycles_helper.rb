module CyclesHelper
CATEGORY_COLOR = {
1 => 'red',
2 => 'blue',
3 => 'palegoldenrod',
4 => 'yellow',
5 => 'fuchsia',
6 => 'darkslategray',
7 => 'green',
}
  def category_color(category_id)
    CATEGORY_COLOR[category_id]
  end
end
