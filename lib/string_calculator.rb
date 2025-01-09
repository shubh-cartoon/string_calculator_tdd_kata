class StringCalculator
  
  def self.add(input)
    return 0 if input.empty?

    numbers = if input.start_with?("//")
                delimiter, input = input[2..].split("\n", 2)
                input.split(delimiter)
              else
                input.split(/,|\n/)
              end.map(&:to_i)

    negatives = numbers.select { |n| n < 0 }
    raise "Negatives not allowed: #{negatives.join(', ')}" unless negatives.empty?

    numbers.sum
  end

end
  