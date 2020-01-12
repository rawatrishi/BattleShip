class Missile

  # @param [String] target
  def initialize(target)
    @row = target[0].ord-65 # convert char to ASCI number
    @column = target[1..].to_i - 1
    @target = target
  end

  # @return [Integer]
  attr_reader :row

  # @return [Integer]
  attr_reader :column

  # @return [String]
  attr_reader :target
end