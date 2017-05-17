class Operator

  attr_accessor :operator_combination

  def initialize(operator_combination)

    @operator_combination = operator_combination



  end

  def evaluate

    @operator_combination.to_s

  end

end