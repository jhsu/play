class SongDecorator
  attr_accessor :model

  # Decorate song instance
  # @param [Song] song instance
  def initialize(song)
    @model = song
  end

  # Decorate single and collection
  def self.decorate(resource)
    if resource.is_a?(Array)
      resource.map {|r| new(r) }
    else
      new(resource)
    end
  end


  def as_json(options={})
    {
      :id => model.id,
      :name => model.name,
      :artist => model.artist,
      :album => model.album,
      :queued => model.queued?,
      :pos => model.pos,
      :path => model.path
      # :last_played => last_played
      # :duration => model.duration
    }
  end

  def to_json(options={})
    as_json(options).to_json
  end

  def method_missing(meth, *args, &block)
    @model.send(meth, *args, &block)
  end

  protected

  def last_played
    last = @model.last_played
    last ? last.iso8601 : ""
  end
end
