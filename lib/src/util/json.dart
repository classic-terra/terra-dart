
import 'dart:convert';
dynamic prepareSignBytes( dynamic obj) {
  if (Array.isArray(obj)) {
    return obj.map(prepareSignBytes);
  }

  // string, number, or null
  if (typeof obj !== `object` || obj === null) {
    return obj;
  }

  const sorted = [];

  Object.keys(obj)
    .sort()
    .forEach(key => {
      if (obj[key] === undefined || obj[key] === null) return;
      sorted[key] = prepareSignBytes(obj[key]);
    });
  return sorted;
}

 abstract class JSONSerializable<A, D, P> {
    A toAmino();
    D toData();
    P toProto();
   String toJSON() {
    return json.encode(prepareSignBytes(toData()));
  }
   String toAminoJSON() {
    return json.encode(prepareSignBytes(toAmino()));
  }
}


 dynamic removeNull(dynamic obj) {
  if (object != && obj is Object) {
    return Object.entries(obj)
      .filter(([, v]) => v != null)
      .reduce(
        (acc, [k, v]) => ({
          ...acc,
          [k]: v === Object(v) && !Array.isArray(v) ? removeNull(v) : v,
        }),
        {}
      );
  }

  return obj;
}