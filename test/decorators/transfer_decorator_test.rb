require "test_helper"

class TransferDecoratorTest < ActiveSupport::TestCase
  test "cpf" do
    assert_equal 'Invalido: ',              TransferDecorator.cpf('')
    assert_equal 'Invalido: 1',             TransferDecorator.cpf('1')
    assert_equal '123.456.789-00',          TransferDecorator.cpf('12345678900')
    assert_equal 'Invalido: 123456789XX',   TransferDecorator.cpf('123456789XX')
    assert_equal 'Invalido: 123456789001',  TransferDecorator.cpf('123456789001')
  end
end
