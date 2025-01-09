class StringCalculator
  
  def self.add(input)
    return 0 if input.empty?

    if input.start_with?("//")
      delimiter, input = input[2..].split("\n", 2)
      input.split(delimiter).map(&:to_i).sum
    else
      input.split(/,|\n/).map(&:to_i).sum
    end
  end
end
  