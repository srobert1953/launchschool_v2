class InvalidCodonError < StandardError; end

class Translation
  PROTEINS = {
    %w(AUG)             => 'Methionine',
    %w(UUU UUC)         => 'Phenylalanine',
    %w(UUA UUG)         => 'Leucine',
    %w(UCU UCC UCA UCG) => 'Serine',
    %w(UAU UAC)         => 'Tyrosine',
    %w(UGU UGC)         => 'Cysteine',
    %w(UGG)             => 'Tryptophan',
    %w(UAA UAG UGA)     => 'STOP'
  }

  def self.of_rna(rna)
    raise InvalidCodonError if rna =~ /[^ACUG]/

    rna.scan(/.../).each_with_object([]) do |codon, proteins|
      protein = of_codon(codon)
      return proteins if protein == 'STOP'
      proteins << protein
    end
  end

  def self.of_codon(codon)
    PROTEINS.select { |key, _| key.include? codon }.values.last
  end
end
