module RailsViewHelpers
  
  # Date and Datetime related view helpers.
  
  module DatetimeHelper
  
    # Return _date_or_datetime_ converted to _format_.
    #
    # Reminder:
    # * you can add formats (e.g. in an initializer)
    # * this gem has monkey-patched +NilClass+ so you can just do this: +datetime.to_s(:short)+ without worrying if +datetime+ is +nil+.
    #
    # @example
    #   datetime_to_s(record.created_at, :long)
    #   datetime_to_s(Date.today, :short)
    # @param date_or_datetime [Date, Datetime] the date/time to convert to string
    # @param format [Symbol] one of +Date::DATE_FORMATS+ or +Time::DATE_FORMATS+
    # @return [String]
    def datetime_to_s(date_or_datetime, format)
      return '' if date_or_datetime.blank?
      return date_or_datetime.to_s(format) if date_or_datetime.instance_of?(Date)
      date_or_datetime.localtime.to_s(format)
    end
    
    
  end
  
end