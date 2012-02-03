# encoding: utf-8

module Moby
  class Hyphenator < Base
    def hyphenate(word)
      w = hyph[word]
      w.nil? ? word : w
    end

    private
      def hyph
        @hyphenation ||= Hash[
          load_list(:hyphenation).readlines.map {|ln|
            ln.chomp!
            [ln.gsub(/•/, ""), ln.gsub(/•/, "-")]
          }
        ]
      end
  end
end
