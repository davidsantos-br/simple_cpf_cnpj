$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'cpf_cnpj'

require 'minitest/autorun'

# Valid CPF and CNPJ generated by http://www.geradordecpf.org/
VALID_CPF = '11026822840'
VALID_CPF_WITH_ZERO = '85465304324' # must have a zero, but not end with one
VALID_CPF_END_ZERO = '47767563820' # the last character must be the only zero
VALID_CNPJ = '64338413000163'
# Invalid CPF and CNPJ are the valid ones with a digit changed
INVALID_CPF = '01026822840'
INVALID_CNPJ = '04338413000163'

# Valid mod11 check digits but wrong lengths
VALID_MOD11_CPF_TOO_SHORT = '4776756382'
VALID_MOD11_CPF_TOO_LONG = '678486213834'

VALID_MOD11_CNPJ_TOO_SHORT ='3490399257915'
VALID_MOD11_CNPJ_TOO_LONG = '690573289026245'

class CpfCnpjTest < MiniTest::Test
end
