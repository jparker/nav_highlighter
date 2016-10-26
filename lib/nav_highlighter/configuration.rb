module NavHighlighter
  module Configuration
    mattr_accessor :highlight_class
    self.highlight_class = 'active'
  end

  def self.configure
    yield config if block_given?
    config
  end

  def self.config
    Configuration
  end
end
