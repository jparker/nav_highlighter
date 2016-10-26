require 'nav_highlighter/utils'

module NavHighlighter
  module ApplicationHelper
    def nav_item(content = nil, name: nil, **options, &block)
      active = @_current_nav == name ? nav_highlight_class : nil
      options[:class] = Utils.merge_classes active, options[:class]
      content_tag :li, content, **options, &block
    end

    def nav_highlight_class
      NavHighlighter.config.highlight_class
    end
  end
end
