class Guest
  attr_reader :name, :phone_number

  def initialize(attributes)
    @name, @phone_number = attributes["name"], attributes["phone_number"]
  end

  def to_s
    @name
  end
end
