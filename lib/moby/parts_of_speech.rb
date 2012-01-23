module Moby
  class PartsOfSpeech
    attr_reader :pos

    #def intialize
    #end

    private
      #def load_pos_db
      #  File.open
      #end

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
