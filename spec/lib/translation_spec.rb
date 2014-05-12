require 'spec_helper'

describe Translation do
  describe "#save" do
    it "give the hash" do
      params = { id: "node1.node2", value: "My Value" }
      hash = {"en"=>{"node1"=>{"node2"=>"My Value"}}}
      saver = double
      expect(TranslationSaver).to receive(:new).with(hash).and_return(saver)
      expect(saver).to receive(:call)
      Translation.new(params).save
    end
  end
end
