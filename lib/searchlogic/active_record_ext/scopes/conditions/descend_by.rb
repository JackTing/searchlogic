module Searchlogic
  module ActiveRecordExt
    module Scopes
      module Conditions
        class DescendBy < Condition
          def scope
            if applicable?
              sort_on = find_sort_on(method_name)              
              klass.order("#{sort_on} DESC") 
            end
          end

          private
            def applicable? 
              !(/descend_by/ =~ method_name).nil?
            end

            def find_sort_on(method)
              args.first || /descend_by_(.*)/.match(method)[1]
            end
        end
      end
    end
  end
end