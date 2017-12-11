require 'minitest/autorun'
require_relative 'run_length_encoding'

class RunLengthEncodingTest < Minitest::Test
  def test_encode_simple
    input = 'AABBBCCCC'
    output = '2A3B4C'
    assert_equal output, RunLengthEncoding.encode(input)
  end

  def test_decode_simple
    input = '2A3B4C'
    output = 'AABBBCCCC'
    assert_equal output, RunLengthEncoding.decode(input)
  end

  def test_encode_with_single_values
    input = 'WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB'
    output = '12WB12W3B24WB'
    assert_equal output, RunLengthEncoding.encode(input)
  end

  def test_decode_with_single_values
    input = '12WB12W3B24WB'
    output = 'WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB'
    assert_equal output, RunLengthEncoding.decode(input)
  end

  def test_decode_encode_combination
    input = 'zzz ZZ  zZ'
    output = 'zzz ZZ  zZ'
    assert_equal output,
                 RunLengthEncoding.decode(RunLengthEncoding.encode(input))
  end


  def test_encode_unicode
    input = '⏰⚽⚽⚽⭐⭐⏰'
    output = '⏰3⚽2⭐⏰'
    assert_equal output, RunLengthEncoding.encode(input)
  end

  def test_decode_unicode
    input = '⏰3⚽2⭐⏰'
    output = '⏰⚽⚽⚽⭐⭐⏰'
    assert_equal output, RunLengthEncoding.decode(input)
  end
end
