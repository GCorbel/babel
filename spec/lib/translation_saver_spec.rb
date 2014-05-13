require 'spec_helper'

module Babel
  describe TranslationSaver do
    describe "#call" do
      it "Save to the file" do
        Babel::TEMP_TRANSLATIONS.push({'en'=>{'node1'=>{'node2'=>'value'}}})
        Babel::TEMP_TRANSLATIONS.push({'en'=>{'node3'=>{'node4'=>'other value'}}})
        Babel::TEMP_TRANSLATIONS.push({'fr'=>{'node5'=>{'node6'=>'une valeur française'}}})
        TranslationSaver.new.call
        I18n.reload!
        expect(I18n.t('node1.node2')).to eq "value"
        expect(I18n.t('node3.node4')).to eq "other value"
        expect(I18n.t('node5.node6')).to eq "translation missing: en.node5.node6"
        I18n.locale = :fr
        expect(I18n.t('node1.node2')).to eq "translation missing: fr.node1.node2"
        expect(I18n.t('node3.node4')).to eq "translation missing: fr.node3.node4"
        expect(I18n.t('node5.node6')).to eq "une valeur française"
      end

      it "Clear the temp translations" do
        Babel::TEMP_TRANSLATIONS.push({'en'=>{'node1'=>{'node2'=>'value'}}})
        TranslationSaver.new.call
        expect(Babel::TEMP_TRANSLATIONS).to be_empty
      end
    end
  end
end
