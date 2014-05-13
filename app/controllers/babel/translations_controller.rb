module Babel
  class TranslationsController < ApplicationController
    def update
      Translation.new(params[:translation]).save
      render json: "ok"
    end

    def create
      TranslationSaver.new.call
      render json: 'ok'
    end
  end
end
