require 'spec_helper'

describe JustRecord::Reader do
  before do
    class User < JustRecord::Reader
    end
  end

  describe ".create" do
    it do
      expect { User.create }.to raise_exception(
        JustRecord::CantWriteException)
    end

    it do
      expect { User.create(name: "io") }.to raise_exception(
        JustRecord::CantWriteException)
    end
  end

  describe "#save" do
    it do
      expect { User.new.save }.to raise_exception(
        JustRecord::CantWriteException)
    end

    it do
      expect { User.new.save(validate: false) }.to raise_exception(
        JustRecord::CantWriteException)
    end
  end

  describe "#update" do
    it do
      expect { User.new.update }.to raise_exception(
        JustRecord::CantWriteException)
    end

    it do
      expect { User.new.update(name: "io") }.to raise_exception(
        JustRecord::CantWriteException)
    end
  end
end

