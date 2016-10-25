# NavHighlighter
Tools for highlighting the active item in a nav element.

## Usage
PENDING:

```ruby
class ThingiesController < ApplicationController
  nav_highlight
end

class WidgetsController < ApplicationController
  nav_highlight
end
```

```erb
<nav>
  <ul>
    <%= nav_item :thingies do %>
      <%= link_to 'Things', :thingies %>
    <% end %>
    <%= nav_item :widgets do %>
      <%= link_to 'Widgets', :widgets %>
    <% end %>
  </ul>
</nav>
```

The "active" class will be added to the first nav item when viewing an action
in ThingiesController and to the second nav time when viewing an action in
WidgetsController.

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
