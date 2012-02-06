class DeepStruct::Hash < Hash

  def initialize(hash)
    hash.each do |k, v|
      self[k.to_sym] = v
    end
  end

  def [](key)
    v = super(key)
    return DeepStruct::Hash.new(v)  if v.is_a?(::Hash)
    return DeepStruct::Array.new(v) if v.is_a?(::Array)
    return v
  end

  def method_missing(key, *args, &block)
    self[key]
  end

  def responds_to?(method)
    self[method]
  end
end

