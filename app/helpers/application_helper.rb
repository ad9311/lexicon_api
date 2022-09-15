module ApplicationHelper
  def enum_to_select(enum)
    arr = []
    enum.each_key { |k| arr << [k.capitalize, k] }
    arr
  end
end
