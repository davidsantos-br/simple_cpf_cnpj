require 'test_helper'

class CpfCnpjTest::HelpersTest < CpfCnpjTest
	class VersionTest < CpfCnpjTest
		def test_that_it_has_a_version_number
			refute_nil ::CpfCnpj::VERSION
		end
	end

	class TypeOfTest < CpfCnpjTest
		def test_recognizes_cpf
			assert_equal(:cpf, CpfCnpj.type_of(VALID_CPF))
		end

		def test_accepts_invalid_cpf
			assert_equal(:cpf, CpfCnpj.type_of(INVALID_CPF))
		end

		def test_recognizes_cnpj
			assert_equal(:cnpj, CpfCnpj.type_of(VALID_CNPJ))
		end

		def test_accepts_invalid_cnpj
			assert_equal(:cnpj, CpfCnpj.type_of(INVALID_CNPJ))
		end

		def test_returns_nil_on_arbitrary_strings
			assert_nil(CpfCnpj.type_of('123456789'))
		end

		def test_returns_nil_on_nil
			assert_nil(CpfCnpj.type_of(nil))
		end

		def test_raises_on_non_nil_non_string
			assert_raises ArgumentError do
				CpfCnpj.type_of(VALID_CPF.to_i)
			end
		end
	end

	class FormatTest < CpfCnpjTest
		def test_formats_a_cpf
			assert_equal("123.456.789-87", CpfCnpj.format("12345678987"))
		end

		def test_formats_a_cnpj
			assert_equal("12.345.678/9876-54", CpfCnpj.format("12345678987654"))
		end

		def test_accepts_random_characters
			assert_equal("abc.def.ghi-jk", CpfCnpj.format('abcdefghijk'))
			assert_equal("ab.cde.fgh/ijkl-mn", CpfCnpj.format('abcdefghijklmn'))
		end

		def test_returns_sender_if_not_cpf_cnpj
			["largelargelarge_string", "small_str"].each do |obj|
				assert_same(obj, CpfCnpj.format(obj))
			end
		end
	end
end
