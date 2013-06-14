module RailsViewHelpers
  
  module JavascriptHelper

    # Convenience method for +javascript:void(0)+
    #
    # @example
    #  js_void   #=> "javascript:void(0)"
    #
    # @return [String]
    def js_void
      @_js_void ||= "javascript:void(0)"
    end
 
  end
  
end