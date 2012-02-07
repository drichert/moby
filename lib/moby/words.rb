module Moby
  class Words < Base
    def acronyms
      # TODO Refactor: chomp in #load_list
      @acronyms = load_list(:acronyms).readlines.map {|ln| ln.chomp }
    end
  end
end
