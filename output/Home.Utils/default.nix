
let
  module = 
    { "Data.Semigroup" = import ../Data.Semigroup;
      "Prelude" = import ../Prelude;
    };
  foreign = import ./foreign.nix;
  singleTick = foreign.singleTick;
  doubleTick = foreign.doubleTick;
  append = module."Data.Semigroup".append module."Data.Semigroup".semigroupString;
  singleTicks = str: append singleTick (append str singleTick);
  doubleTicks = str: append doubleTick (append str doubleTick);
in
  {inherit singleTick doubleTick singleTicks doubleTicks;}