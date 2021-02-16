require "test_helper"

class TransferTest < ActiveSupport::TestCase
  test "kind_sign" do
    transfer = Transfer.new

    assert_equal nil, transfer.kind
    assert_equal 'X', transfer.kind_sign

    transfer.kind = 1
    assert_equal 1, transfer.kind
    assert_equal '+', transfer.kind_sign
  end

  test "kind_nature" do
    transfer = Transfer.new

    assert_equal nil, transfer.kind
    assert_equal 'X', transfer.kind_nature

    transfer.kind = 1
    assert_equal 1, transfer.kind
    assert_equal 'Entrada', transfer.kind_nature
  end

  test "kind_name" do
    transfer = Transfer.new

    assert_equal nil, transfer.kind
    assert_equal 'X', transfer.kind_name

    transfer.kind = 1
    assert_equal 1, transfer.kind
    assert_equal 'Débito', transfer.kind_name
  end
end
