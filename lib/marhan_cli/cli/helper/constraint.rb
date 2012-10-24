module MarhanCli
  class Constraint

    def self.notNil!(argument)
      raise ArgumentError "Given argument => #{argument} must not be null" if argument.nil?
    end

  end
end