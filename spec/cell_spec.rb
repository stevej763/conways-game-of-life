require 'cell'

describe 'Cell' do

  describe ".revive" do
    context "given cell is dead" do
      underTest = Cell.new(false)
      underTest.revive
      it "is alive and returns true" do
        expect(underTest.is_alive).to eq(true)
      end
    end
  end

  describe ".kill" do
    context "given cell is alive" do
      underTest = Cell.new(true)
      underTest.kill
      it "is dead and returns false" do
        expect(underTest.is_alive).to eq(false)
      end
    end
  end

  describe ".is_alive" do
    context "given cell is alive" do
      underTest = Cell.new
      underTest.revive
      it "returns true" do
        expect(underTest.is_alive).to eq(true)
      end
    end
  end
end