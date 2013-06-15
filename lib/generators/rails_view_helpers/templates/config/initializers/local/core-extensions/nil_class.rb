class NilClass
  
  # This hack enables us to call +to_s+ on a (supposedly) Date/Datetime
  # with out worrying that the value may be +nil+.
  #
  # @return [String]
  def to_s(*args)
    return super unless args.length == 1
    
    format = args.first
    return super unless known_formats.include?(format)
    
    return ''
  end
  
  private
  
  def known_formats
    @known_formats ||= Date::DATE_FORMATS + Time::DATE_FORMATS
  end
end