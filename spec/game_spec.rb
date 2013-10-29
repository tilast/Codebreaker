require 'spec_helper'
 
module Codebreaker

  describe Game do
    let(:output) { double('output').as_null_object }
    let(:game) { Game.new(output) }

    describe "#start" do

      it "sends a welcome message" do
        output.should_receive(:puts).with('Welcome to Codebreaker!')
        game.start()
      end

      it "prompts for the first guess" do
		    output.should_receive(:puts).with("Enter guess:")
      	game.start()
      end

      it "generates secret code" do
        game.secretCode.length.should == 4
      end

      it "can lose if playes does not have more attempts" do
        game.start()
        
      end
    end

    describe "#guess" do
    	it "sends mark into output" do
        game.start('1234')
        output.should_receive(:puts).with('++++')
        game.guess('1234')
      end
    end

  end
end