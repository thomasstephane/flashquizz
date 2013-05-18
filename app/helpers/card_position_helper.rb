helpers do  
  def button(number)
    "button#{(number+1)}" 
  end

  def rotation(string)
    [-1, 1].sample * ((string.length) % 10)
  end
end