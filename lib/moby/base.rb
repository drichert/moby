module Moby
  class Base
    private
      def load_list(list_name)
        File.open(
          File.join(
            Moby::base_path,
            *%w{share moby},
            wordlist_paths[list_name]
          )
        )
      end

      def wordlist_paths
        { :pos         => "parts-of-speech/mobypos.UTF-8.txt",
          :hyphenation => "hyphenation/mhyph.UTF-8.txt",
          :thesaurus   => "thesaurus/mthesaur.UTF-8.txt",
          :acronyms    => "words/UTF-8/acronyms"
        }
      end
  end
end
