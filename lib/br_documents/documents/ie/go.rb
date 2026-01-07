# http://www.sintegra.gov.br/Cad_Estados/cad_GO.html
module BRDocuments
  class IE::GO < IE::Base

    set_verify_digits_weights first: %w(9 8 7 6 5 4 3 2)

    set_format_regexp %r{^(\d{2})[.-]?(\d{3})[.-]?(\d{3})[.-]?(\d{1})}

    set_pretty_format_mask %(%s.%s.%s-%s)

    set_fixed_digits [10, 11, *20..29]

    def self.valid_fixed_digits?(number)
      number = new(number).normalize
      current = number[0..1].join.to_i

      self.const_get('FIXED_INITIAL_NUMBERS').member?(current)
    end

    def self.fixed_digits
      super.sample.to_s.split(//).map(&:to_i)
    end
  end
end
