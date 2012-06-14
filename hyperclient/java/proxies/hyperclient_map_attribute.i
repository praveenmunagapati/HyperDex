// Write our own (safe) getters for attr and setters for attr, map_key and value
// in order to avoid warnings
//
%ignore hyperclient_map_attribute::attr;
%ignore hyperclient_map_attribute::map_key;
%ignore hyperclient_map_attribute::value;

%typemap(javacode) hyperclient_map_attribute
%{
  // Holds the size of the hyperclient_map_attribute array that is instance
  // is the head of. This signed 64 bit integer will be interpreted as an
  // unsigned 64 bit integer at the c/c++ level.
  //
  private long attrs_sz = 0;

  long getAttrsSz()
  {
    return attrs_sz;
  }

  void setAttrsSz(long value)
  {
    attrs_sz = value;
  }

  String getMapAttrName()
  {
    return HyperClient.read_map_attr_name(this);
  }
%}
