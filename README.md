# DesktopDelivery

Open Rails emails in your desktop client.

## Installation

In you `Gemfile` :

```ruby
group :development do
  gem "desktop_delivery"
end
```

## Configuration

In `config/environments/development.rb` :

```ruby
config.action_mailer.delivery_method = :desktop_delivery
```

## License

[WTFPL](https://en.wikipedia.org/wiki/WTFPL)
