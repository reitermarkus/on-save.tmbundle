def markdown?
  !(ENV.fetch('TM_SCOPE', '') !~ /\btext\.html\.markdown\b/)
end

def trim(line)
  if markdown?
    # Leave escaped whitespace character at the end of the line, and remove
    # trailing whitespace characters, except for two if there was an escaped
    # whitespace character followed by at least two whitespace characters.
    line.sub!(/((?<=\\[\t\ ])[\t ]|(?<=\\[\t\ ]{3})[\t ]+)$/, '')

    # Remove trailing whitespace characters, except for two to preserve line breaks,
    # and leave whitespace-only lines to preserve indentation.
    line.sub!(/(?<=[^\\\t \ ][\t ]{2})[\t ]+$/, '')

    # Remove single trailing whitespace characters,
    # and leave whitespace-only lines to preserve indentation.
    line.sub!(/(?<=[^\\\t \ ])[\t ]$/, '')
  else
    # Remove trailing whitespace characters, except for one if there
    # is an escaped whitespace character at the end of the line.
    line.sub!(/(?<!\\)[\t ]+$/, '')

    if m = line.match(/(\\+)[\t ]+$/)
      line.sub!(/[\t ]+$/, '') if m[1].length.even?
    end
  end

  line
end
