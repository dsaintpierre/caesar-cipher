class Caesar
  def initialize(shift)
    @alphanum = [*"a".."z", *"A".."Z", *"0".."9"]
    @cipher = (@alphanum[shift .. -1] + @alphanum[0 .. shift - 1])
  end

  def encode(string)
    string = string.split("").map do |char|
      @alphanum.include?(char) ? @cipher[@alphanum.index(char)] : char
    end.join
  end

  def decode(string)
    string = string.split("").map do |char|
      @alphanum.include?(char) ? @alphanum[@cipher.index(char)] : char
    end.join
  end
end
