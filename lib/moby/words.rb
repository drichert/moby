module Moby
  class Words < Base
    def acronyms
      @acronyms = load_list(:acronyms)
    end
  end
end
