class Character < ActiveRecord::Base
  has_many :lines

  def episodes
    lines.map {|l| l.scene.episode}.uniq
  end

  def lines_for_dict
    lines.map {|l| Line.strip_directions(l.content)}.join
  end

  def markov_dict
    if @markov_dict
      @markov_dict
    else
      @markov_dict = MarkyMarkov::TemporaryDictionary.new
      @markov_dict.parse_string(self.lines_for_dict)
      @markov_dict
    end
  end

  def generate_sentences(n)
    markov_dict.generate_n_sentences n
  end
end
