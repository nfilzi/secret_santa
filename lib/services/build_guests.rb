class BuildGuests
  private
  attr_reader :guests_filepath

  public
  def initialize(guests_filepath)
    @guests_filepath = guests_filepath
  end

  def call
    guests_data = YAML.load_file(guests_filepath)
    return guests_data.shuffle.map {|guest_data| Guest.new(guest_data)}
  end
end
