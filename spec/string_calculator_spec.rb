require 'string_calculator'

RSpec.describe StringCalculator do
  describe ".add" do
    it "returns 0 for an empty string" do
      expect(StringCalculator.add("")).to eq(0)
    end

    it "returns the number when a single number is provided" do
      expect(StringCalculator.add("5")).to eq(5)
    end

    it "returns the sum of two numbers" do
      expect(StringCalculator.add("1,2")).to eq(3)
    end

    it "returns the sum of multiple numbers" do
      expect(StringCalculator.add("1,2,3,4,5")).to eq(15)
    end

    it "handles newlines as delimiters" do
      expect(StringCalculator.add("1\n2,3")).to eq(6)
    end

    it "supports custom delimiters" do
      expect(StringCalculator.add("//;\n1;2")).to eq(3)
    end

    it "raises an exception for negative numbers" do
      expect { StringCalculator.add("1,-2,3") }.to raise_error("Negatives not allowed: -2")
    end

    it "ignores numbers greater than 1000" do
      expect(StringCalculator.add("2,1001,6")).to eq(8)
    end

    it "supports delimiters of any length" do
      expect(StringCalculator.add("//[***]\n1***2***3")).to eq(6)
    end

    it "supports multiple delimiters" do
      expect(StringCalculator.add("//[*][%]\n1*2%3")).to eq(6)
    end
  end
end
