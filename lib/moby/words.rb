module Moby
  class Words < Base
    def acronyms
      @acronyms = load_list(:acronyms)
    end

    def common
      @common = load_list(:common)
    end
  end
end
