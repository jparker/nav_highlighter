module NavHighlighter
  module Configuration
    mattr_accessor :highlight_class
    self.highlight_class = 'active'
  end

  def self.config
    Configuration
  end

  def self.configure
    yield Configuration
  end
end
