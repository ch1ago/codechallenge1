require "test_helper"

class TransferServiceTest < ActiveSupport::TestCase
  test '_parse_line' do
    line = '2201903010000050200845152540738473****1231231233MARCOS PEREIRAMERCADO DA AVENIDA'
    attrs = TransferService._parse_line(line)

    assert_equal Hash, attrs.class
    assert_equal DateTime, attrs[:at].class

    attrs[:at] = attrs[:at].to_i
    expected = {
      :kind         => 2,
      :at           => 1551492753,
      :amount       => 502.0,
      :cpf          => "84515254073",
      :card_number  => "8473****1231",
      :store_owner  => "MARCOS PEREIRA",
      :store_name   => "MERCADO DA AVENIDA"
    }
    assert_equal expected, attrs
  end

  test "_parse_line_date_time" do
    dt = TransferService._parse_line_date_time('20190301', '141808')

    assert_equal DateTime, dt.class
    assert_equal 'date: 20190301 time: 141808 zone: -0300', dt.strftime('date: %Y%m%d time: %H%M%S zone: %z')
  end
end
