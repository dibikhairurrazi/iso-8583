module ISO8583
  # Basic length types definition.
  INF = -> (data, length, index) { data[index, data.size] }
  FIX = -> (data, length, index) { data[index, length] }
  VAR = -> (data, length, index) { FIX.call(data, length + data[index, length].to_i, index) }

  # Length types definition.
  FIXED   = -> (data, definition, index) { FIX.call(data.data, definition[:length], index) }
  LVAR    = -> (data, definition, index) { VAR.call(data.data, 1, index) }
  LLVAR   = -> (data, definition, index) { VAR.call(data.data, 2, index) }
  LLLVAR  = -> (data, definition, index) { VAR.call(data.data, 3, index) }
end
