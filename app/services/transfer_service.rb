module TransferService
  module_function

  # class Error < StandardError; end
  # class Custom < Error; end

  # Retorna quantidade de linhas em branco
  def import(org, path)
    blank_lines = 0

    _read_file(path) do |line|
      if line.present?
        attrs = _parse_line(line)
        org.transfers.create!(attrs)
      else
        blank_lines += 1
      end
    end

    blank_lines
  end

  # Le o arquivo de forma otimizada
  def _read_file(path)
    # https://ruby-doc.org/core-2.7.1/IO.html#method-c-foreach
    File.foreach(path).with_index do |line|
       yield line
    end
  end

  # Instrucoes:
  #
  # Tipo    01  01  01  Tipo da transação
  # Data    02  09  08  Data da ocorrência
  # Valor   10  19  10  Valor da movimentação em centavos
  # CPF     20  30  11  CPF do beneficiário
  # Cartão  31  42  12  Cartão utilizado na transação
  # Hora    43  48  06  Hora da ocorrência atendendo ao fuso de UTC-3
  # Dono    49  62  14  Nome do representante da loja
  # Loja    63  81  19  Nome da loja
  #
  # TESTADO!
  def _parse_line(line)
    kind         = line[0..0].to_i
    date         = line[1..8]
    amount_cents = line[9..18].to_i
    cpf          = line[19..29]
    card_number  = line[30..41]
    time         = line[42..47]
    store_owner  = line[48..61]
    store_name   = line[62..80]

    at = _parse_line_date_time(date, time)
    amount = amount_cents.to_f/100

    attrs = {
      kind:         kind,
      at:           at,
      amount:       amount,
      cpf:          cpf,
      card_number:  card_number,
      store_owner:  store_owner,
      store_name:   store_name,
    }
  end

  # TESTADO!
  def _parse_line_date_time(date, time)
    DateTime.parse("#{date}T#{time}-0300")
  end
end
