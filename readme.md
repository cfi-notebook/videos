# Videos

Accept the URL to a video and generate embed code or other useful attributes.

## Usage

```ruby
# Gemfile
gem 'videos', git: 'https://github.com/ryanburnette/videos.git'
```

```
require 'videos'
v = Videos.factory('https://youtu.be/abc123')
v.id
v.to_html
```
