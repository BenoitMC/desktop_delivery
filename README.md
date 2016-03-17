# DesktopDelivery

Open Rails emails in your desktop client

## Installation

In you `Gemfile` :

```ruby
gem "desktop_delivery"
```

Or :

```
gem install desktop_delivery
```

## Configuration

In `config/environments/development.rb` :

```ruby
config.action_mailer.delivery_method = :desktop_delivery
```

## Compatibility

It uses [Launchy](https://github.com/copiousfreetime/launchy) to open `.eml` files.

Tested on:

- Mac OS X 10.11 + Mail
- Ubuntu 14.04 + Thunderbird

## Licence

[WTFPL](https://en.wikipedia.org/wiki/WTFPL)
