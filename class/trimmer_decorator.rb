require_relative 'decorator'

class TrimmerDecorator < Decorator
  def initialize(nameable)
    super
    @nameable = nameable
  end

  def correct_name
    stripped = @nameable.correct_name.strip
    trimmed = stripped[0..9]
    @nameable.correct_name.length > 10 ? trimmed.capitalize : stripped.capitalize
  end
end
