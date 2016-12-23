module NavHighlighter
  class Engine < ::Rails::Engine
    isolate_namespace NavHighlighter

    initializer 'nav_highlighter.view_helpers' do
      ActionView::Base.send :include, helpers
    end
  end
end
