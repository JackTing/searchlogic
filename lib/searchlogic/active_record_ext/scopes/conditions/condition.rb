module Searchlogic
  module ActiveRecordExt
    module Scopes
      module Conditions
        class Condition < ActiveRecord::Base
          attr_reader :klass, :args, :block, :value, :table_name, :method_name
          attr_accessor :column_name
          class << self
            def generate_scope(*args)
              new(args[0], args[1], args[2]).scope 
            end
          end

          def initialize(klass, method_name, args, &block)
            @klass = klass
            @method_name = method_name
            @table_name = args[1] || klass.to_s.underscore.pluralize
            @value = args[0]
            @args = args
            @block = block
          end

          def matcher
            raise NotImplementedError.new("You must define a #matcher method")
          end
          
          def applicable? 
            !(/#{self.class.matcher}$/ =~ method_name).nil?
          end

        end
      end
    end
  end
end