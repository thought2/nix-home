
let
  module = {"Prelude" = import ../Prelude;};
  foreign = import ./foreign.nix;
  toStringImpl = foreign.toStringImpl;
  ToString-Dict = x: x;
  toStringDerivation = {toString = toStringImpl;};
  toString = dict: 
    let
      __pattern0 = __fail: 
        let
          v = dict;
        in
          v.toString;
      __patternFail = builtins.throw "Pattern match failure in src/Nix.purs at 6:3 - 6:26";
    in
      __pattern0 __patternFail;
in
  {inherit toString toStringImpl toStringDerivation;}