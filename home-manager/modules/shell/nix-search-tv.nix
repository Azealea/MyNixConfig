{pkgs, ...}: {
  home.packages = with pkgs; [
    (pkgs.writeShellApplication {
      name = "ns";
      runtimeInputs = with pkgs; [
        fzf
        nix-search-tv
      ];
      text = builtins.readFile ./nix-search-tv-fzf.sh;
      checkPhase = "";
    })
  ];
}
