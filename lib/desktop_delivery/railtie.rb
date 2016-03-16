module DesktopDelivery
  class Railtie < Rails::Railtie
    initializer "desktop_delivery.add_delivery_method" do
      symbol  = :desktop_delivery
      klass   = DesktopDelivery::DeliveryMethod
      options = {
        :path => Rails.root.join("tmp/emails"),
      }

      ActionMailer::Base.add_delivery_method(symbol, klass, options)
    end
  end
end
