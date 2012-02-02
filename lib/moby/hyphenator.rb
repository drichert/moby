# encoding: utf-8

module Moby
  class Hyphenator
    def hyphenate(word)
      w = hyph[word]
      w.nil? ? word : w
    end

    private
      def hyph
        # TODO: DRY; see parts_of_speech
        path = %w{share moby hyphenation mhyph.UTF-8.txt}
        hyph = File.open(File.join(Moby::base_path, *path))

        @hyph ||= Hash[
          hyph.readlines.map {|ln|
            ln.chomp!
            [ln.gsub(/•/, ""), ln.gsub(/•/, "-")]
          }
        ]
      end
  end
end
