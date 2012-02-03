module Moby
  class PartsOfSpeech < Base
    def find(word)
      { :word  => word,
        :found => pos.has_key?(word),
        :code  => pos_code(word),
        :pos   => pos_breakdown(word)
      }
    end

    %w{
      noun plural noun_phrase adjective adverb conjunction
      preposition interjection pronoun definite_article
      indefinite_article nominative
    }.each do |p|
      # Define list method
      define_method("#{p}s".to_sym) { words(p.to_sym) }
      # Define query method
      define_method("#{p}?".to_sym) {|word| pos?(word, p.to_sym) }
    end

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
