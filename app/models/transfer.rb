class Transfer < ApplicationRecord
  belongs_to :org

  # Eu sei usar Enumeradores, mas escolhi nao usar devido a quantidade de campos de texto
  #
  # Tipo  Descrição Natureza  Sinal
  KINDS = {
    1 => ['+', 'Entrada' , 'Débito'                  ],
    2 => ['-', 'Saída'   , 'Boleto'                  ],
    3 => ['-', 'Saída'   , 'Financiamento'           ],
    4 => ['+', 'Entrada' , 'Crédito'                 ],
    5 => ['+', 'Entrada' , 'Recebimento Empréstimo ' ],
    6 => ['+', 'Entrada' , 'Vendas'                  ],
    7 => ['+', 'Entrada' , 'Recebimento TED'         ],
    8 => ['+', 'Entrada' , 'Recebimento DOC'         ],
    9 => ['-', 'Saída'   , 'Aluguel'                 ],
  }

  def kind_sign
    KINDS[kind][0]
  rescue
    'X'
  end

  def kind_nature
    KINDS[kind][1]
  rescue
    'X'
  end

  def kind_name
    KINDS[kind][2]
  rescue
    'X'
  end
end
