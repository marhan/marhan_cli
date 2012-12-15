module MarhanCli
  class Constraint

    def self.not_nil!(argument, argument_name)
      raise ArgumentError, "Given argument '#{argument_name}' must not be nil" if argument.nil?
    end

    def self.not_nil_or_empty!(argument, message)
      if argument.nil? or argument.empty?
        raise ArgumentError, message
      end
    end

  end
end