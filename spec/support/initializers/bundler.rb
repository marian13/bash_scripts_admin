# frozen_string_literal: true

ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../../Gemfile", __dir__)

require "bundler/setup"

require "bundler/setup"

Bundler.require(:default, :test)

puts "RSpec: Bundler initializer loaded."
