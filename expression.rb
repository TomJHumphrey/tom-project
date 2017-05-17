class Expression

  attr

  def initialize(operator, leftNumber, rightNumber)

    @op = operator

    @left = leftNumber

    @right = rightNumber

  end

  def evaluate

    puts "value #{@op}"

    @left.send(@op.to_s, @right)

  end

end