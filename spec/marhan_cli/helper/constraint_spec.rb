# encoding: utf-8
require 'spec_helper'
require 'marhan_cli/helper/constraint'

describe "Constraint" do

  context ".not_nil!" do
    describe "with nil as argument" do
      it "throws exception" do
        expect { MarhanCli::Constraint.not_nil!(nil, "") }.to raise_error
      end
    end

    describe "with valid string as argument" do
      it "throws exception" do
        expect { MarhanCli::Constraint.not_nil!("any_string", "any_string") }.to_not raise_error
      end
    end
  end

  context ".not_nil_or_empty!" do
    describe "with nil as argument" do
      it "throws exception" do
        expect { MarhanCli::Constraint.not_nil_or_empty!(nil, "") }.to raise_error
      end
    end
    describe "with empty string as argument" do
      it "throws exception" do
        expect { MarhanCli::Constraint.not_nil_or_empty!("", "") }.to raise_error
      end
    end

    describe "with valid string as argument" do
      it "throws no exception" do
        expect { MarhanCli::Constraint.not_nil!("any_string", "any_string") }.to_not raise_error
      end
    end
  end

end