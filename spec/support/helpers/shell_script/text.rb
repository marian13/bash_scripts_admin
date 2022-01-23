# frozen_string_literal: true

RSpec.configure do |config|
  mod = Module.new do
    class ShellScript
      class Text
        attr_reader :string, :runner

        def initialize(string, runner: :bash)
          @string = string
          @runner = runner
        end

        class << self
          def create(value, **kwargs)
            case value
            when ::String then new(value, **kwargs)
            when Text     then copy(value, **kwargs)
            else raise
            end
          end

          def copy(other, **kwargs)
            new(other.string, **other.to_kwargs.merge(kwargs))
          end
        end

        def to_s
          case runner
          when :sh   then "sh -c \"#{string}\""
          when :bash then "bash -c \"#{string}\""
          else raise
          end
        end

        def to_kwargs
          { runner: }
        end

        def with_runner(runner)
          Text.copy(self, runner:)
        end
      end
    end
  end

  config.include mod
end

puts "RSpec: shell_script text helper loaded."
