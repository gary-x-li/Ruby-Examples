require "test/unit"
require "sequence"

class Sequence_Test < Test::Unit::TestCase
  def test_generate_next
    seq = Sequence.new(5, 2) {|a| a.last + 2}
    actual = seq.generate_next
    assert_equal(4, actual , "generate_next failed" )
    seq2 = Sequence.new(5, 1, 1) {|a| a[-2] + a[-1]}
    seq2.generate_next
    assert_equal(2, seq2.curr, "failed")
  end

  def test_index
    seq = Sequence.new(5, 2) {|a| a.last + 2}
    result1 = seq[7]
    assert_equal(nil, result1, "should be nil")
    result2 = seq[2]
    assert_equal(6, result2, "should be 6")
    result3 = seq[1]
    assert_equal(4, result3, "should be 4")
  end

  def test_each
    evens = Sequence.new(5, 2) {|a| a.last + 2}
    odds  = Sequence.new(5, 1) {|a| a.last + 2}
    fibs  = Sequence.new(5, 1, 1) {|a| a[-2] + a[-1]}

    assert_equal [2,4,6,8,10], evens.to_a
    assert_equal [1,3,5,7,9],  odds.to_a
    assert_equal [1,1,2,3,5],  fibs.to_a
    a = []
    evens.each {|s| a << s}
    assert_equal [2,4,6,8,10], a
  end

end