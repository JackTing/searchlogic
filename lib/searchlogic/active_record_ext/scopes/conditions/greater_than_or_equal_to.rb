module Searchlogic
  module ActiveRecordExt
    module Scopes
      module Conditions
        class GreaterThanOrEqualTo < Condition
          include ChronicSupport
          def scope
            if applicable?
              find_column
              klass.where("#{table_name}.#{column_name} >= ?", "#{value}") 
            end
          end
            def self.matcher
              "_greater_than_or_equal_to"
            end
          private  
            def find_column
              @column_name = /(.*)_greater_than_or_equal_to$/.match(method_name)[1]
            end
            def applicable? 
              !(/^(#{klass.column_names.join("|")})#{self.class.matcher}$/ =~ method_name).nil?
            end
        end
      end
    end
  end
end