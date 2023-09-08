require_relative 'decorator'

class CapitalizeDecorator < Decorator
  def initialize(nameable)
    super
    @nameable = nameable
  end

  def correct_name
    trimmed = @nameable.correct_name[0..9]
    @nameable.correct_name.length > 10 ? trimmed.capitalize : @nameable.correct_name.capitalize
  end
end
