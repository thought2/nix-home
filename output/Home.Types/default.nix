
let
  module = 
    { "Home.Pkgs.ChromiumSetSearches.Types" = import ../Home.Pkgs.ChromiumSetSearches.Types;
      "Nix" = import ../Nix;
      "Prim.Row" = import ../Prim.Row;
      "Unsafe.Coerce" = import ../Unsafe.Coerce;
    };
  slice = _: module."Unsafe.Coerce".unsafeCoerce;
in
  {inherit slice;}