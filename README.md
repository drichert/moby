Moby
====
[![Build Status](https://secure.travis-ci.org/drichert/moby.png)](http://travis-ci.org/drichert/moby)
[![Dependency Status](https://gemnasium.com/drichert/moby.png)](https://gemnasium.com/drichert/moby)


Ruby interface for [Moby Project](http://en.wikipedia.org/wiki/Moby_Project)
[word lists](http://www.gutenberg.org/catalog/world/results?title=moby+list).
The goal is to provide interfaces for most of the Moby Project texts and/or
wordlists. 

Interfaces currently provided are listed below. More to come!


## Install

    gem install moby

## Parts of Speech

### Usage

```ruby
pos = Moby::PartsOfSpeech.new
```

### List

Get word lists by part of speech 

```ruby
pos.nouns 
pos.plurals
pos.noun_phrases
pos.adjectives
pos.adverbs
pos.conjunctions
pos.prepositions
pos.interjections
pos.pronouns
pos.definite_articles
pos.indefinite_articles
pos.nominatives
```

`#verbs` takes an optional `:type` parameter since there's three types 

```ruby
pos.verbs
pos.verbs(:type => :all) # default
pos.verbs(:type => :usu)
pos.verbs(:type => :transitive)
pos.verbs(:type => :intransitive)  
```

### Find

Find parts of speech info for a word

```ruby
pos.find("word") 
#=> {
#=>   :word => "word", 
#=>   :code => "Nt", 
#=>   :pos => [:noun, :vert_transitive]
#=> }
  
pos.find("walk") 
#=> {
#=>   :word => "walk", 
#=>   :code => "iNt", 
#=>   :pos => [:noun, :verb_transitive, :verb_intransitive]
#=> }
```

### Query

Check a word by part of speech

```ruby
pos.noun?("animal")             #=> true
pos.verb?("run")                #=> true
pos.intransitive_verb?("walk")  #=> true
pos.adjective?("sky")           #=> false
```

`#verb?` takes an optional `:type` parameter (like `#verbs`)

```ruby
pos.verb?("abandon", :type => :transitive)          #=> true
pos.verb?("overurbanized", :type => :intransitive)  #=> false
pos.verb?("overurbanized")                          #=> true
```

## Hyphenator

### Usage

```ruby
hyph = Moby::Hyphenator.new
```

Hyphenate words

```ruby
hyph.hyphenate("bardish") #=> "bard-ish"
hyph.hyphenate("hastelessness") #=> "haste-less-ness"
hyph.hyphenate("interpollinating") #=> #"in-ter-pol-li-nat-ing"
```

Returns the word unchanged if not found or if it shouldn't be hyphenated

```ruby
hyph.hyphenate("Mordor") #=> "Mordor" (not found)
hyph.hyphenate("jest") #=> "jest" (shouldn't be hyphenated)
```

## Thesaurus

### Usage

```ruby
thes = Moby::Thesaurus.new
```

Get related words (`#syns` and `#related` are aliases of `#synonyms`)

```ruby
thes.synonyms("apercu") 
#=> ["a priori knowledge", "abbreviation", "abbreviature", "abrege", ... ]

thes.syns("buoyant")
#=> ["adaptable", "adaptive", "afloat", "airy", "animated", ... ]

thes.related("infiltration")
#=> ["absorbency", "absorbent", "absorption", "access", "admission", ... ]
```

Returns an empty array if word isn't found

```ruby
thes.syns("Chewbacca") #=> []
```

## Words

### Usage

```ruby
words = Moby::Words.new
```

### Lists

Get lists; lines are not processed.

```ruby
words.acronyms
words.common
words.compound
words.crossword # CROSSWD.TXT
words.crossword_additions # CRSWD-D.TXT
words.fiction 
words.freq
words.freq_usenet_92 # FREQ-INT.TXT
words.kjvfreq
words.names
words.female_names # NAMES-F.TXT
words.male_names # NAMES-M.TXT
words.misspelled # OFTENMIS.TXT
words.places 
words.single
words.us_constitution # USACONST.TXT
```

## Copyright

Copyright &copy; 2012 Dan Richert. See LICENSE for details

