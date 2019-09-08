require "../any"

module Random
  def self.sample(weighted_items : Array(Tuple(Any, Int))) : Any
    weight_acc = 0
    weight_acc_items = weighted_items.map do |e|
      weight_acc += e[1]
      {e[0], weight_acc}
    end

    return weight_acc_items.sample[0] if weight_acc == 0
    criteria = rand(weight_acc) + 1
    weight_acc_items.select { |e| criteria <= e[1] }.first[0]
  end
end
