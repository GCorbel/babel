module ActionView
  module Helpers
    module TranslationHelper
      alias :original_translate :translate
      def translate(key, options = {})
        # If the user has specified rescue_format then pass it all through, otherwise use
        # raise and do the work ourselves
        options[:raise] = true unless options.key?(:raise) || options.key?(:rescue_format)
        if html_safe_translation_key?(key)
          html_safe_options = options.dup
          options.except(*I18n::RESERVED_KEYS).each do |name, value|
            unless name == :count && value.is_a?(Numeric)
              html_safe_options[name] = ERB::Util.html_escape(value.to_s)
            end
          end
          translation = I18n.translate(scope_key_by_partial(key), html_safe_options)

          translation.respond_to?(:html_safe) ? translation.html_safe : translation
        else
          scoped_key = scope_key_by_partial(key)
          editable(nil, id: scoped_key, method: 'value',
                   object: 'translations', prefix: '/babel') do
            I18n.translate(scoped_key, options)
          end
        end
      rescue I18n::MissingTranslationData => e
        keys = I18n.normalize_keys(e.locale, e.key, e.options[:scope])
        editable(nil, id: keys.join('.'), method: 'value',
                 object: 'translations', prefix: '/babel') do
          "No translation"
        end
      end
      alias :t :translate
    end
  end
end
