class SongDecorator
  attr_accessor :model

  # Decorate song instance
  # @param [Song] song instance
  def initialize(song)
    @model = song
  end

  def as_json(options={})
    {
      :id => model.id,
      :post => model.pos,
      :artist => model.artist,
      :album => model.album,
      :name => model.name
    }
  end

  def to_json(options={})
    as_json(options).to_json
  end

  def method_missing(meth, *args, &block)
    @model.send(meth, *args, &block)
  end
end
