module Moby
  class PartsOfSpeech
    def find(word)
      { word: word, code: pos_code(word), pos: pos_breakdown(word) }
    end

    def method_missing(meth, *args, &block)
      meth_s = meth.to_s

      # #noun, #adverb, #verb_usu_participle, etc
      if pos_names.include?(meth)
        pos.select {|word, code| code.include?(pos_code_map.key(meth)) }.keys
      # #noun?, #adverb?, #adjective?, etc
      elsif meth_s.end_with?("?") and pos_names.include?(meth_s.chop.to_sym)
        find(args.first)[:pos].include?(meth_s.chop.to_sym)
      else
        super
      end
    end

    def respond_to?(meth)
      if pos_names.include?(meth)
        true
      else
        super
      end
    end

    private
      def pos
        path = %w{share moby parts-of-speech mobypos.UTF-8.txt}
        pos = File.open(File.join(Moby::base_path, *path))

        @pos ||= Hash[
          pos.readlines.map {|ln|
            ln.split('\\').map {|p| p.strip }
          }
        ]
      end

      # Get part of speech code for word
      def pos_code(word)
        pos[word]
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

      def pos_codes
        pos_code_map.keys
      end

      def pos_names
        pos_code_map.values
      end

      # Convert POS code to array of descriptive symbols from #pos_code_map
      def pos_breakdown(word)
        pos_code(word).chars.to_a.map {|c| pos_code_map[c] }
      end
  end
end
