require 'test_helper'

class NavigationTest < ActionDispatch::IntegrationTest
  def test_highlighting
    get authors_path
    assert_select 'ul li:not(.active)', text: 'Books'
    assert_select 'ul li.active',       text: 'Authors'
    assert_select 'ul li:not(.active)', text: 'Home'

    get books_path
    assert_select 'ul li.active',       text: 'Books'
    assert_select 'ul li:not(.active)', text: 'Authors'
    assert_select 'ul li:not(.active)', text: 'Home'

    get book_path '42'
    assert_select 'ul li.active',       text: 'Books'
    assert_select 'ul li:not(.active)', text: 'Authors'
    assert_select 'ul li:not(.active)', text: 'Home'

    get book_editions_path book_id: '42'
    assert_select 'ul li.active',       text: 'Books'
    assert_select 'ul li:not(.active)', text: 'Authors'
    assert_select 'ul li:not(.active)', text: 'Home'

    get book_url_path book_id: '42'
    assert_select 'ul li.active',       text: 'Books'
    assert_select 'ul li:not(.active)', text: 'Authors'
    assert_select 'ul li:not(.active)', text: 'Home'

    get author_url_path author_id: '42'
    assert_select 'ul li:not(.active)', text: 'Books'
    assert_select 'ul li.active',       text: 'Authors'
    assert_select 'ul li:not(.active)', text: 'Home'

    get home_path
    assert_select 'ul li:not(.active)', text: 'Books'
    assert_select 'ul li:not(.active)', text: 'Authors'
    assert_select 'ul li.active',       text: 'Home'
  end

  def test_highlighting_with_custom_configuration
    cls = NavHighlighter.config.highlight_class
    NavHighlighter.config.highlight_class = 'highlight'

    get authors_path
    assert_select 'ul li.highlight', text: 'Authors'
  ensure
    NavHighlighter.config.highlight_class = cls
  end
end
