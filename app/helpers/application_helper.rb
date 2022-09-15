module ApplicationHelper
  def enum_to_select(enum)
    arr = []
    enum.each_key { |k| arr << [k.capitalize, k] }
    arr
  end

  def initial_letter(str, period = false)
    i = str[0]
    if period
      i + "."
    else
      i
    end
  end

  def format_index(index)
    "#{index + 1}."
  end
end
