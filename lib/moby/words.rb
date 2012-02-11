module Moby
  class Words < Base
    def acronyms
      @acronyms ||= load_list(:acronyms)
    end

    def common
      @common ||= load_list(:common)
    end

    def compound
      @compound = load_list(:compound)
    end

    def crossword
      @crossword = load_list(:crossword)
    end
  end
end
