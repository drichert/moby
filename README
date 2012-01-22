ruby-moby
Ruby interface for Moby Project wordlists

Dan Richert
dan.richert@gmail.com


pos = Moby::PartsOfSpeech.new
pos = Moby::POS.new # alias

# Return arrays for the corresponding parts of speech
pos.noun
pos.plural
pos.noun_phrase
pos.verb_usu_participle
  # alias: verb_u
  # Should there by a default verb type?
pos.verb_transitive
  # alias: verb_t
pos.verb_intransitive
  # alias verb_i
pos.adjective
pos.adverb
pos.conjunction
pos.preposition
pos.interjection
pos.pronoun
pos.definite_article
pos.indefintie_article
pos.nominative


pos.noun?("animal")             # true
pos.verb?("run")                # true
pos.intransitive_verb?("walk")  # true


pos.find("word")
# {
#   :word => "word",
#   :code => "Nt",
#   :pos => [
#     :noun, :verb_transitive
#   ]
# }

pos.find("walk")
# {
#   :word => "walk",
#   :code => "iNt",
#   :pos => [
#     :noun, :verb_transitive, :verb_intransitive
#   ]
# }


