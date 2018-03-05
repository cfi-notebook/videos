# Videos

Videos is an API for going from a URL to video embed code.

Right now only the basics are implemented.

YouTube, Vimeo and `<video>` tags are supported.

## Usage

```ruby
# Gemfile
gem 'videos', git: 'https://github.com/ryanburnette/videos.git'
```

```
require 'videos'
v = Videos.new('https://youtu.be/abc123')
v.id
v.to_html
```
