class Item
  attr_reader :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def update_quality
    case @name
    when 'NORMAL ITEM'
      normal
    when 'Aged Brie'
      aged_brie
    when 'Sulfuras, Hand of Ragnaros'
      sulfuras
    when 'Backstage passes to a TAFKAL80ETC concert'
      backstage_pass
    end
  end

  def normal
    @sell_in -= 1

    return if @quality == 0
    @quality -= 1
    @quality -= 1 if @sell_in <= 0
  end

  def aged_brie
    @sell_in -= 1

    return if @quality == 50
    @quality += 1
    @quality += 1 if @sell_in <= 0 && @quality < 50
  end

  def sulfuras
  end

  def backstage_pass
    @quality += 1 if @quality < 50
    @quality += 1 if @sell_in <= 10 && @quality < 50
    @quality += 1 if @sell_in <= 5 && @quality < 50

    @quality = 0 if @sell_in <= 0

    @sell_in -= 1
  end
end
