module TransferDecorator
  module_function

  # class Error < StandardError; end
  # class Custom < Error; end

  # md: <MatchData "12345678900" 1:"123" 2:"456" 3:"789" 4:"00">
  #
  # "123.456.789-00"
  # "Invalido: 123"
  #
  # TESTADO!
  def cpf(s)
    md = s.match(/^(\d{3})(\d{3})(\d{3})(\d{2})$/)

    if md.present?
      "#{md[1]}.#{md[2]}.#{md[3]}-#{md[4]}"
    else
      "Invalido: #{s}"
    end
  end
end
