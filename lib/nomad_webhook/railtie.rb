require 'rails'

module NomadWebhook
  class Railties < ::Rails::Railtie
    initializer 'Rails logger' do
      NomadWebhook.logger = Rails.logger
    end
  end
end
