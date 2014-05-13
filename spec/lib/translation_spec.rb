require 'spec_helper'

module Babel
  describe Translation do
    describe "#save" do
      it "Use the new translation" do
        params = { id: "node1.node2", value: "My Value" }
        Translation.new(params).save
        expect(I18n.t('node1.node2')).to eq "My Value"
      end

      it "Store the translation in memory" do
        params = { id: "node1.node2", value: "My Value" }
        Translation.new(params).save
        expected = [{"en"=>{"node1"=>{"node2"=>"My Value"}}}]
        expect(Babel::TEMP_TRANSLATIONS).to eq expected
      end
    end
  end
end
