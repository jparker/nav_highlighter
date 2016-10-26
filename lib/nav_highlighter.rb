require 'nav_highlighter/engine'
require 'nav_highlighter/configuration'

module NavHighlighter
  module NavHighlighting
    def nav_highlight(name = controller_name.to_sym, **options, &block)
      before_action **options do
        name = instance_eval(&block) if block_given?
        @_current_nav = name
      end
    end
  end
end
