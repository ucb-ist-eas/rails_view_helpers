module RailsViewHelpers
  
  module HtmlHelper

    # Includes controller and action name as data attributes.
    #
    # @example
    #  body_tag()  #=> <body data-action='index' data-controller='home'>
    #
    #  body_tag(id: 'my-id', class: 'my-class')  #=> <body class="my-class" data-action="index" data-controller="home" id="my-id">
    # @param options [Hash] become attributes of the BODY tag
    # @return [String]
    def body_tag(options={}, &block)
      options = canonicalize_options(options)
      options.delete(:class) if options[:class].blank?
      options[:data] ||= {}
      options[:data][:controller] = controller.controller_name
      options[:data][:action] = controller.action_name
      
      content_tag(:body, options) do
        yield
      end
    end
    
    # Displays a check-mark (&#10004;) when _bln_ is +true+ else +nbsp+.
    #
    # @example
    #  bln(true)                         #=> "&#10004;"  (check mark)
    #  bln(false)                        #=> "&nbsp;"    (space)
    #  bln(true, 'Admin')                #=> "Admin"
    #  bln(false, 'Admin', "not Admin")  #=> "not Admin"
    # @param bool [Boolean]
    # @param true_string [String] the string to display if _bln_ is +true+.  Caller is responsible for escaping and/or marking html_safe.
    # @param false_string [String] the string to display if _bln_ is +false+. Caller is responsible for escaping and/or marking html_safe.
    def bln(bool, true_string="&#10004;".html_safe, false_string=nbsp)
      if bool
        true_string
      else
        false_string
      end
    end
    
    # Same as +bln+ but wrapped in a TD and centered (w/rail_view_helper.css)
    #
    # @example
    #   td_bln(true)  #=> <td class="c">&#10004;</td>
    # @return [String]
    def td_bln(*args)
      options = canonicalize_options(args.extract_options!)
      options = ensure_class(options, 'c')
      
      content_tag(:td, bln(*args), options)
    end
    
    
    def th_actions(*args)
      options = canonicalize_options(args.extract_options!)
      colspan = args.shift || 1
      text = args.shift || 'Actions'
      options[:colspan] = colspan
      options[:class] = 'c' if options[:class].empty?
      
      content_tag(:th, text, options)
    end

    # Returns one or more non-breaking spaces (&nbsp;) marked +html_safe+.
    #
    # @example
    #   nbsp      #=> "&nbsp;"
    #   nbsp(3)   #=> "&nbsp;&nbsp;&nbsp;"
    #
    # @param count [FixNum] the number of non-breaking spaces to return
    # @return [String] that is html_safe
    def nbsp(count=1)
      ('&nbsp;' * count).html_safe
    end
    
  end
  
end