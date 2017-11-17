require 'minitest/autorun'

require_relative '05_encrypted_pioneers'

class TestDesipher < MiniTest::Test
  def setup
    file_name = '05_encrypted_pioneers_list.txt'
    @list = File.readlines(file_name).map { |name| name.strip }
    @decipher = Decipher.new
  end

  def test_list_loaded
    assert_equal(19, @list.size)
  end

  def test_first_encrypted_item
    encrypted = "Ada Lovelace"
    decipher = @decipher.deciphers_list(@list).first
    assert_equal(encrypted, decipher)
  end

  def test_fift_encripted_item
    encrypted = "Abdullah Muhammad bin Musa al-Khwarizmi"
    decipher = @decipher.deciphers_list(@list)[5]

    assert_equal(encrypted, decipher)
  end
end
