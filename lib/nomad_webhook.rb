require 'active_support/concern'

require 'nomad_webhook/version'
require 'nomad_webhook/processor'
require 'nomad_webhook/railtie'

module NomadWebhook
  class << self
    attr_accessor :logger
  end
end
