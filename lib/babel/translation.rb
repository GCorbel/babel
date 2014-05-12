module Babel
  class Translation
    def initialize(params)
      @params = params
    end

    def save
      TranslationSaver.new(to_hash).call
    end

    private
    def to_hash
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
      @keys ||= [I18n.locale.to_s] + @params[:id].split('.')
    end
  end
end
