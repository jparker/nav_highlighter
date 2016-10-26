require 'test_helper'
require 'nav_highlighter/utils'

module NavHighlighter
  class UtilsTest < Minitest::Test
    def test_merge_classes_with_arrays
      actual = Utils.merge_classes ['a', 'b'], ['b', 'c']
      assert_equal ['a', 'b', 'c'], actual
    end

    def test_merge_classes_with_strings
      actual = Utils.merge_classes 'a b', 'b c'
      assert_equal ['a', 'b', 'c'], actual
    end

    def test_merge_classes_with_arrays_and_strings
      actual = Utils.merge_classes ['a', 'b'], 'b c'
      assert_equal ['a', 'b', 'c'], actual
    end

    def test_merge_classes_with_one_nil_argument
      actual = Utils.merge_classes 'a b', nil
      assert_equal ['a', 'b'], actual

      actual = Utils.merge_classes nil, 'a b'
      assert_equal ['a', 'b'], actual
    end

    def test_merge_classes_with_two_nil_arguments
      actual = Utils.merge_classes nil, nil
      assert_nil actual
    end
  end
end
