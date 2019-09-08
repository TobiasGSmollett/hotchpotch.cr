require "./spec_helper"

describe Hotchpotch do
  it "methods" do
    expected = ["|", "&", "^", "hash", "to_unsafe", "to_s", "to_s", "clone", "==", "!="]
    actual = Bool.methods
    true.should eq(actual == expected)
  end

  it "registry" do
    Registry.add("a", 1)
    Registry.add(1, "b")

    true.should eq(Registry.get("a") == 1)
    true.should eq(Registry.get(1) == "b")
  end

  it "weighted_sample" do
    items = [{"a", 1}, {"b", 29}, {"c", 70}]
    result = {"a" => 0, "b" => 0, "c" => 0}
    1000.times { result[Random.sample(items)] += 1 }
  end
end
