# point_mutations.rb
class DNA
  def initialize(dna)
    @dna = dna
  end

  def hamming_distance(other_dna)
    length = [@dna.length, other_dna.length].min

    (0...length).reduce(0) do |result, idx|
      @dna[idx] == other_dna[idx] ? result : result + 1
    end
  end
end
