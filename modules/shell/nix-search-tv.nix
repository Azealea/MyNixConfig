{
  pkgs,
  username,
  ...
}: {
  home-manager.users.${username}.home.packages = [
    (pkgs.writeShellApplication {
      name = "ns";
      runtimeInputs = with pkgs; [fzf nix-search-tv];
      text = builtins.readFile ./nix-search-tv-fzf.sh;
      checkPhase = "";
    })
  ];
}
