require 'spec_helper'

describe Conversion do
  describe '#mass-assignment' do
    it { should allow_mass_assignment_of :crop_type }
    it { should allow_mass_assignment_of :height }
    it { should allow_mass_assignment_of :image }
    it { should allow_mass_assignment_of :width }
  end

  describe '#validations' do
    it { should validate_presence_of :url }
    it { should validate_numericality_of(:width).with_message('is not a number') }
    it { should validate_numericality_of(:height).with_message('is not a number') }
    it { should ensure_inclusion_of(:crop_type).in_array(['fit', 'fill']) }
  end
  
end
