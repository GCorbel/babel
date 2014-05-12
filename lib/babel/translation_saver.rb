class TranslationSaver
  def initialize(hash)
    @hash = hash
  end

  def call
    store_translation_in_memory
    write_in_file
  end

  private
  def store_translation_in_memory
    I18n.backend.store_translations(I18n.locale, @hash)
  end

  def write_in_file
    path = "#{Rails.root}/config/locales/#{I18n.locale}.yml"
    exisiting_locales = YAML.load(File.read(path))
    full_locales = deep_merge(exisiting_locales, @hash)
    File.open(path, 'w') { |f| f.write(full_locales.to_yaml) }
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
