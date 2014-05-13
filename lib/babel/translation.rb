module Babel
  class Translation
    def initialize(params)
      @params = params
    end

    def save
      I18n.backend.store_translations(I18n.locale, hash)
      TEMP_TRANSLATIONS.push(I18n.locale.to_s => hash)
    end

    private
    def hash
      return @hash if @hash
      @hash = {}
      @hash[keys.pop.to_s] = @params[:value]
      keys.reverse.each do |k|
        new_hash = {}
        new_hash[k.to_s] = @hash
        @hash = new_hash
      end
      @hash
    end

    def keys
      @keys ||= @params[:id].split('.')
    end
  end
end
