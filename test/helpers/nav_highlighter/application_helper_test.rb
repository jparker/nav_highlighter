require 'test_helper'

module NavHighlighter
  class ApplicationHelperTest < ActionView::TestCase
    def test_nav_item_active_with_name
      activate_nav :foo
      actual = nav_item 'Foo', name: :foo
      assert_equal '<li class="active">Foo</li>', actual
    end

    def test_nav_item_inactive_with_name
      activate_nav :bar
      actual = nav_item 'Foo', name: :foo
      assert_equal '<li>Foo</li>', actual
    end

    def test_nav_item_active_with_no_name
      deactivate_nav
      actual = nav_item 'Foo'
      assert_equal '<li class="active">Foo</li>', actual
    end

    def test_nav_item_inactive_with_no_name
      activate_nav :bar
      actual = nav_item 'Foo'
      assert_equal '<li>Foo</li>', actual
    end

    def test_nav_item_active_with_block_and_name
      activate_nav :foo
      actual = nav_item(name: :foo) { 'Foo' }
      assert_equal '<li class="active">Foo</li>', actual
    end

    def test_nav_item_inactive_with_block_and_name
      activate_nav :bar
      actual = nav_item(name: :foo) { 'Foo' }
      assert_equal '<li>Foo</li>', actual
    end

    def test_nav_item_active_with_block_and_no_name
      deactivate_nav
      actual = nav_item { 'Foo' }
      assert_equal '<li class="active">Foo</li>', actual
    end

    def test_nav_item_inactive_with_block_and_no_name
      activate_nav :bar
      actual = nav_item { 'Foo' }
      assert_equal '<li>Foo</li>', actual
    end

    def test_nav_item_passes_attributes_through_to_item_tag
      actual = nav_item(class: 'foo', id: 'foo') { 'Foo' }
      assert_equal '<li class="active foo" id="foo">Foo</li>', actual
    end

    def test_nav_item_with_custom_configuration
      cls = NavHighlighter.config.highlight_class
      NavHighlighter.config.highlight_class = 'highlight'

      @_current_nav = :foo
      actual = nav_item(name: :foo) { 'Foo' }
      assert_equal '<li class="highlight">Foo</li>', actual
    ensure
      NavHighlighter.config.highlight_class = cls
    end

    private

    def activate_nav(name)
      @_current_nav = name
    end

    def deactivate_nav
      @_current_nav = nil
    end
  end
end
