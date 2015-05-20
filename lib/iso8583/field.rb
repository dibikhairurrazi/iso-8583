module ISO8583
  class Field
    attr_reader :id, :data, :value, :options

    def initialize(id, data, options)
      @id = id
      @data = data
      @options = options
      @value = extract_value
    end

    def to_s
      @data
    end

    private

    def extract_value
      return data[1, data.size] if options[:type] == :LVAR
      return data[2, data.size] if options[:type] == :LLVAR
      return data[3, data.size] if options[:type] == :LLLVAR
      data
    end
  end
end
