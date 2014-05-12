module Babel
  class TranslationsController < ApplicationController
    def update
      Translation.new(params[:translation]).save
      render json: "ok"
    end
  end
end
