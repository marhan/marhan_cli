module MarhanCli
  class Constraint

    def self.notNil!(argument, argument_name)
      raise ArgumentError, "Given argument '#{argument_name}' must not be nil" if argument.nil?
    end

  end
end