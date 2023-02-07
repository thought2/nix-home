{ config, pkgs, ... }:
{
  programs.chromium = {
    enable = true;
    extensions = [
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # uBlock Origin
      { id = "hdokiejnpimakedhajhdlcegeplioahd"; } # LastPass
      { id = "aghfnjkcakhmadgdomlmlhhaocbkloab"; } # Just Black
      { id = "egnjhciaieeiiohknchakcodbpgjnchh"; } # Tab Wrangler
    ];
  };
}
