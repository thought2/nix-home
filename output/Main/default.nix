
let
  module = 
    { "Data.Foldable" = import ../Data.Foldable;
      "Data.Maybe" = import ../Data.Maybe;
      "Data.Semigroup" = import ../Data.Semigroup;
      "Prelude" = import ../Prelude;
    };
  append = module."Data.Semigroup".append module."Data.Semigroup".semigroupString;
  myNames = module."Data.Foldable".foldr module."Data.Foldable".foldableArray (name: accum: append name (append " " accum)) "" ["Eelco"
    "Jon"
    "Graham"];
in
  {inherit myNames;}