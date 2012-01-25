require "iconv"

module Moby
  class PartsOfSpeech
    attr_reader :pos

    def initialize
      load_pos_db
    end

    private
      def load_pos_db
        path = %w{share moby parts-of-speech mobypos.UTF-8.txt}
        pos = File.open(File.join(Moby::base_path, *path))

        @pos = Hash[
          pos.readlines.map {|ln|
            l = ln.split('\\').map {|p| p.gsub(/\s*$/, "") }
            #puts l
            #l
          }
        ]
      end

      def code_map
        {
          :N => :noun,
          :p => :plural,
          :h => :noun_phrase,
          :V => :verb_usu_participle,
          :i => :verb_intransitive,
          :a => :adjective,
          :v => :adverb,
          :C => :conjunction,
          :P => :preposition,
          :! => :interjection,
          :r => :pronoun,
          :D => :definite_article,
          :I => :indefinite_article,
          :o => :nominative
        }
      end
  end
end
