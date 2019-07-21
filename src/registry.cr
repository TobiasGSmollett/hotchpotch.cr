require "./any"

# See: https://github.com/crystal-lang/crystal/issues/4572#issuecomment-309038214

module Registry
  private abstract struct Any; end
  private record A(T) < Any, this : T

  @@hash = {} of Any => Any

  def self.add(key : ::Any, value : ::Any)
    k = A.new(key)
    v = A.new(value)
    @@hash[k] = v
  end

  def self.get(key : ::Any)
    @@hash[A.new(key)].this
  end
end
