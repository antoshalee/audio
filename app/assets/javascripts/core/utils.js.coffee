window.utils ||= {}

window.utils.pluralize = (i, str1, str2, str3) ->
  plural = (a) ->
    if a % 10 is 1 and a % 100 isnt 11
      0
    else if a % 10 >= 2 and a % 10 <= 4 and (a % 100 < 10 or a % 100 >= 20)
      1
    else
      2
  switch plural(i)
    when 0
      str1
    when 1
      str2
    else
      str3