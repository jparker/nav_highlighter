module NavHighlighter
  module Utils
    def self.merge_classes(a, b)
      return nil if a.nil? && b.nil?
      Array(a).compact.flat_map(&:split) | Array(b).compact.flat_map(&:split)
    end
  end
end
