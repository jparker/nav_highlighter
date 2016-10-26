# NavHighlighter
Tools for highlighting the active item in a nav element.

## Usage

To use NavHighlighter you need to make the #nav_item helper method available to
the views and the #nav_highlight method available to controllers.

```ruby
class ApplicationController
  # Make #nav_item helper available to views.
  helper NavHighlighter::Engine.helpers

  # Make #nav_highlight available to controllers.
  extend NavHighlighter::NavHighlighting
end
```

In your controllers, call #nav_highlight to specify the name of the nav item
that should be highlighted when views from that particular controller are
rendered. The name of the nav item to be highlighted will be inferred from the
name of the controller, e.g., AuthorsController would map to a nav item named
`:authors`. (This can be configured when calling #nav_highlight.)

```ruby
class AuthorsController < ApplicationController
  nav_highlight
end

class BooksController < ApplicationController
  nav_highlight
end

class HomeController < ApplicationController
end
```

Finally, where ever you render your nav element, use the #nav_item helper. Pass
the name of the item as an argument. If no name is passed, the nav item will be
unnamed. If the nav is rendered from a controller that does not call
#nav_highlight, the unnamed item will be highlighted.

```erb
<nav>
  <ul>
    <%= nav_item name: :authors do %>
      <%= link_to 'Authors', :authors %>
    <% end %>
    <%= nav_item name: :books do %>
      <%= link_to 'Books', :books %>
    <% end %>
    <%= nav_item do %>
      <%= link_to 'Misc', root_path
    <% end %>
  </ul>
</nav>
```

The first nav item will be highlighted when viewing an action in the
BookgsController, and the second item will be highlighted when viewing an
action in the AuthorsController. When viewing an action in a controller which
does not call #nav_highlight, the third item will be highlighted by default as
it is unnamed.

## Custom Configuration

By default, the highlighted nav item will received the CSS class "active". This
can be configured by calling `NavHighlighter.configure` (ideally from an
initializer).

```ruby
NavHighlighter.configure do |config|
  # Use "highlight" instead of "active".
  config.highlight_class = 'highlight'
end
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'nav_highlighter'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install nav_highlighter
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
