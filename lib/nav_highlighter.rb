require 'nav_highlighter/engine'
require 'nav_highlighter/configuration'

module NavHighlighter
  module NavHighlighting
    def nav_highlight(name = controller_name.to_sym, **options, &block)
      before_action **options do
        @_current_nav = if block_given?
                          instance_eval &block
                        else
                          name
                        end
      end
    end
  end
end
