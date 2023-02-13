
let
  module = 
    { "Home.Types" = import ../Home.Types;
      "Prelude" = import ../Prelude;
    };
  main = pkgs: pkgs.writeShellScriptBin "chromium-set-searches" "echo hello!";
in
  {inherit main;}