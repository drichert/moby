module Moby
  class Thesaurus < Base
    def synonyms(word)
      syns = thes[word]
      syns.nil? ? [] : syns
    end
    alias_method :syns, :synonyms
    alias_method :related, :synonyms

    private
      def thes
        @thes ||= Hash[
          load_list(:thesaurus).map {|ln|
            ln = ln.split(",")
            [ln.first, ln[1, ln.size - 1]]
          }
        ]
      end
  end
end
