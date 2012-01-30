Moby
====

**WIP**

Ruby interface for [Moby Project](http://en.wikipedia.org/wiki/Moby_Project)
[wordlists](http://www.gutenberg.org/catalog/world/results?title=moby+list)

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


