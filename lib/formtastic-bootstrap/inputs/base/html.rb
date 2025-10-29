module FormtasticBootstrap
  module Inputs
    module Base
      module Html
        include Formtastic::Inputs::Base::Html

        def form_control_input_html_options
          options = input_html_options.symbolize_keys
          orig_class = options[:class]
          new_class = [orig_class, "form-control"].compact.join(" ")
          options.merge(:class => new_class)
        end

        def input_html_options
          options = super.symbolize_keys
          if errors?
            { :class => "error" }.merge(options) do |key, oldval, newval|
              key == :class ? [newval, oldval].compact.join(" ") : newval
            end
          else
            options
          end
        end
      end
    end
  end
end
