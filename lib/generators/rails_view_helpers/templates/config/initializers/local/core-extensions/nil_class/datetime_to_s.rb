class NilClass
  
  alias_method :original_to_s, :to_s
  
  # This hack enables us to call +to_s+ on a (supposedly) Date/Datetime
  # with out worrying that the value may be +nil+.
  #
  # @return [String]
  def to_s(*args)
    if known_formats.include?(args.first)
      ''
    else
      original_to_s(*args)
    end
  end
  
  private
  
  def known_formats
    @known_formats ||= Date::DATE_FORMATS.keys + Time::DATE_FORMATS.keys
  end
end