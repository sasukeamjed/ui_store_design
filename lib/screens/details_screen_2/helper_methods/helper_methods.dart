String removeAttributePa(String attributeName){
  String modifiedAttributeName = attributeName;

  if(attributeName.contains("pa_")){
    modifiedAttributeName = modifiedAttributeName.replaceAll("pa_", "");
  }
  if(attributeName.contains("attribute_pa_")){
    modifiedAttributeName = modifiedAttributeName.replaceAll("attribute_pa_", "");
  }
  if(attributeName.contains("attribute_")){
    modifiedAttributeName = modifiedAttributeName.replaceAll("attribute_", "");
  }

  return modifiedAttributeName;
}