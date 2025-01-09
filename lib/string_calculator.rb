class StringCalculator
  def self.add(input)
    return 0 if input.empty?

    numbers = if input.start_with?("//")
                delimiters = extract_delimiters(input)
                input = input.split("\n", 2).last
                input.split(Regexp.union(delimiters))
              else
                input.split(/,|\n/)
              end.map(&:to_i)

    negatives = numbers.select { |n| n < 0 }
    raise "Negatives not allowed: #{negatives.join(', ')}" unless negatives.empty?

    numbers.reject { |n| n > 1000 }.sum
  end

  private

  def self.extract_delimiters(input)
    if input.start_with?("//[")
      input.scan(/\[(.+?)\]/).flatten
    else
      [input[2]]
    end
  end
end
