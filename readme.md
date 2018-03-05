# Videos

Videos is an API for going from a URL to video embed code.

Right now only the basics are implemented.

YouTube, Vimeo and `<video>` tags are supported.

## Usage

```ruby
# Gemfile
gem 'rb42-videos', '~> 1.0'
# or
gem 'videos', '~> 1.0', git: 'https://github.com/ryanburnette/videos.git'
```

```
require 'videos'
v = Videos.factory('https://youtu.be/abc123')
v.id
v.to_html
```
