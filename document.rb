class Document

  def initialize
    @counts = {}
  end

  def read(src)
    hyphenated_line = ''

    src.each do |line|
      line.chomp!
      line.downcase!
      line.gsub! /[^A-Za-z'-]/, ' '

      if line =~ /-$/
        hyphenated_line << line.chop
        next
      end

      line = hyphenated_line + line unless '' == hyphenated_line
      hyphenated_line = ''

      line.split(/\b/).each do |word|
        if !!@counts[word]
          @counts[word] += 1
        else
          @counts[word] = 1
        end
      end
    end
  end

  def sorted_counts
    @counts.sort_by {|k,v| v}.reverse
  end

end
