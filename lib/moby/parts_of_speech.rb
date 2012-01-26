module Moby
  class PartsOfSpeech
    def initialize
      load_pos_db
    end

    def find(word)
      { word: word, code: pos_code(word), pos: pos_breakdown(word) }
    end

    def method_missing(meth, *args, &block)
      # #noun, #adverb, #verb_usu_participle, etc
      if pos_code_map.values.include?(meth)
        @pos.select {|word, code| code.include?(pos_code_map.key(meth)) }.keys
      else
        super
      end
    end

    def respond_to?(meth)
      true if pos_code_map.values.include?(meth)

      super
    end

    private
      def load_pos_db
        path = %w{share moby parts-of-speech mobypos.UTF-8.txt}
        pos = File.open(File.join(Moby::base_path, *path))

        @pos = Hash[
          pos.readlines.map {|ln|
            ln.split('\\').map {|p| p.strip }
          }
        ]
      end

      # Get part of speech code for word
      def pos_code(word)
        @pos[word]
      end

      def pos_code_map
        @pos_code_map ||= {
          "N" => :noun,
          "p" => :plural,
          "h" => :noun_phrase,
          "V" => :verb_usu_participle,
          "t" => :verb_transitive,
          "i" => :verb_intransitive,
          "A" => :adjective,
          "v" => :adverb,
          "C" => :conjunction,
          "P" => :preposition,
          "!" => :interjection,
          "r" => :pronoun,
          "D" => :definite_article,
          "I" => :indefinite_article,
          "o" => :nominative
        }
      end

      # Convert POS code to array of descriptive symbols from #pos_code_map
      def pos_breakdown(word)
        pos_code(word).chars.to_a.map {|c| pos_code_map[c] }
      end
  end
end
