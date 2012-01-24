require "iconv"

module Moby
  class PartsOfSpeech
    attr_reader :pos

    def initialize
      load_pos_db
    end

    private
      def load_pos_db
        path = %w{share moby parts-of-speech mobypos.txt}
        pos = File.open(File.join(Moby::base_path, *path))

        @pos = Hash[
          pos.readlines.map {|ln|
            fix_byte_seq(ln).match(
              /(.*)\\(.*)/
            ).captures.map {|p|
              p.chop
            }
          }
        ]
      end

      # Fix UTF-8 byte sequence
      # http://po-ru.com/diary/fixing-invalid-utf-8-in-ruby-revisited/
      def fix_byte_seq(str)
        Iconv.new('UTF-8//IGNORE', 'UTF-8').iconv(str + ' ')[0..-2]
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
