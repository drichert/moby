module Moby
  class PartsOfSpeech < Base
    def find(word)
      { :word  => word,
        :found => pos.has_key?(word),
        :code  => pos_code(word),
        :pos   => pos_breakdown(word)
      }
    end

    # Word list methods

    def nouns; words(:noun); end
    def plurals; words(:plural) end
    def noun_phrases; words(:noun_phrase); end
    def adjectives; words(:adjective); end
    def adverbs; words(:adverb); end
    def conjunctions; words(:conjunction); end
    def prepositions; words(:preposition); end
    def interjections; words(:interjection); end
    def pronouns; words(:pronoun); end
    def definite_articles; words(:definite_article); end
    def indefinite_articles; words(:indefinite_article); end
    def nominatives; words(:nominatives); end

    def verbs(options = {:type => :all})
      case options[:type]
      when :all
        words(:verb_usu_participle) +
        words(:verb_transitive) +
        words(:verb_intransitive)
      when :usu
        words(:verb_usu_participle)
      when :transitive
        words(:verb_transitive)
      when :intransitive
        words(:verb_intransitive)
      end
    end

    # Query methods

    def noun?(word); pos?(word, :noun); end
    def plural?(word); pos?(word, :plural); end
    def noun_phrase?(word); pos?(word, :noun_phrase); end
    def adjective?(word); pos?(word, :adjective); end
    def adverb?(word); pos?(word, :adverb); end
    def conjunction?(word); pos?(word, :conjunction); end
    def preposition?(word); pos?(word, :preposition); end
    def interjection?(word); pos?(word, :interjection); end
    def pronoun?(word); pos?(word, :pronoun); end
    def definite_article?(word); pos?(word, :definite_article); end
    def indefinite_article?(word); pos?(word, :indefinite_article); end
    def nominative?(word); pos?(word, :nominative); end

    def verb?(word, options = {:type => :all})
      case options[:type]
      when :all
        pos?(word, :verb_usu_participle) ||
        pos?(word, :verb_transitive) ||
        pos?(word, :verb_intransitive)
      when :usu
        pos?(word, :verb_usu_participle)
      when :transitive
        pos?(word, :verb_transitive)
      when :intransitive
        pos?(word, :verb_intransitive)
      end
    end

    private
      def pos
        @pos ||= Hash[
          load_list(:pos).readlines.map {|ln|
            ln.split('\\').map {|p| p.strip }
          }
        ]

        @pos.default = ""
        @pos
      end

      def pos?(word, pos_name)
        find(word)[:pos].include?(pos_name.to_sym)
      end

      # Get words by pos name
      def words(pos_name)
        pos.select {|w, c| c.include?(pos_code_map.key(pos_name)) }.keys
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
