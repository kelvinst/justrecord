module JustRecord
  class Reader < ActiveRecord::Base
    self.abstract_class = true

    def self.create(*attrs)
      raise CantWriteException
    end

    def save(*attrs)
      raise CantWriteException
    end

    def update(*attrs)
      raise CantWriteException
    end
  end
end

