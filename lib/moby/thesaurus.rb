module Moby
  class Thesaurus
    def synonyms(word)
      syns = thes[word]
      syns.nil? ? [] : syns
    end

    private
      def thes
        # TODO: DRY; see hyphenator
        # TODO: unclear - don't use 'thes' as a var name
        path = %w{share moby thesaurus mthesaur.UTF-8.txt}
        thes = File.open(File.join(Moby::base_path, *path))

        @thes ||= Hash[
          thes.readlines.map {|ln|
            ln = ln.chomp.split(",")
            [ln.first, ln[1, ln.size - 1]]
          }
        ]
      end
  end
end
