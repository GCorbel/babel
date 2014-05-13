module Babel
  class TranslationSaver
    def call
      I18n.available_locales.each do |locale|
        write_in_file(locale)
      end
      clear_temp_translations
    end

    private
    def clear_temp_translations
      Babel::TEMP_TRANSLATIONS.clear
    end

    def write_in_file(locale)
      path = translation_path(locale)
      existing_translations = read_translations(path)
      translations = [existing_translations] + new_translations(locale)
      full_translations = merge(translations)
      File.open(path, 'w') { |f| f.write(full_translations.to_yaml) }
    end

    def merge(translations)
      full_translations = {}
      translations.each do |translation|
        full_translations = deep_merge(full_translations, translation)
      end
      full_translations
    end

    def read_translations(path)
      YAML.load(File.read(path)).to_hash
    end

    def translation_path(locale)
      "#{Rails.root}/config/locales/#{locale}.yml"
    end

    def new_translations(locale)
      Babel::TEMP_TRANSLATIONS.map {|t| t if t.keys.first == locale.to_s}.compact
    end

    def deep_merge(first_hash, other_hash, &block)
      other_hash.each_pair do |current_key, other_value|
        this_value = first_hash[current_key]
        first_hash[current_key] = if this_value.is_a?(Hash) && other_value.is_a?(Hash)
                                    deep_merge(this_value, other_value, &block)
                                  else
                                    other_value
                                  end
      end
      first_hash
    end
  end
end
