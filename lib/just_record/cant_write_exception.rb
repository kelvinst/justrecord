module JustRecord
  class CantWriteException < RuntimeError
    def message
      "You can't call this write method"
    end
  end
end
