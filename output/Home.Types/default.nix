
let
  module = 
    { "Home.Pkgs.ChromiumSetSearches.Types" = import ../Home.Pkgs.ChromiumSetSearches.Types;
      "Prelude" = import ../Prelude;
      "Prim.Row" = import ../Prim.Row;
      "Prim.RowList" = import ../Prim.RowList;
      "Unsafe.Coerce" = import ../Unsafe.Coerce;
    };
  partial = _: module."Unsafe.Coerce".unsafeCoerce;
in
  {inherit partial;}