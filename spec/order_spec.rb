require 'order'

describe Order do
  subject(:order) { described_class.new(menu: menu) }
  let(:menu) { double(:Menu, dishes: [dish1, dish2, dish3]) }
  let(:dish1) { double(:Dish, name: "Chicken", price: 1) }
  let(:dish2) { double(:Dish, name: "Fish", price: 2) }
  let(:dish3) { double(:Dish, name: "Steak", price: 3) }

  describe '#from_menu' do
    it 'displays the menu for selection' do
      expect(menu).to receive(:display)
      order.from_menu
    end
  end

  describe '#add' do
    it 'gets the dish from the menu' do
      expect(menu).to receive(:dishes)
      order.add 0
    end

    it 'adds a meal to the order' do
      expect{ order.add 0 }.to change { order.summary }.to include dish1.name
    end
  end

  describe '#summary' do
    it 'shows a summary of order' do
      expect{ order.add 0 }.to change { order.summary }.to include dish1.name
    end
  end

  describe '#submit' do
    it 'submit final order' do
      expect{ order.submit }.to change{ order }.to be_confirmed
    end
  end
end
