module NavHighlighter
  class Engine < ::Rails::Engine
    isolate_namespace NavHighlighter

    initializer 'comparison.view_helpers' do
      ActionView::Base.send :include, helpers
    end
  end
end
