require 'spec_helper'

describe TranslationSaver do
  describe "#call" do
    it "save to the file" do
      FileUtils.cp('spec/fixtures/en.yml', 'spec/dummy/config/locales/')
      hash = { "node1" => { "node2" => "value" } }
      TranslationSaver.new(hash).call
      expect(I18n.t('node1.node2')).to eq "value"
    end
  end
end
