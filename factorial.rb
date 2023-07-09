def factorial(number)
  return 1 if number == 0 || number == 1
  factorial(number - 1) * number
end
