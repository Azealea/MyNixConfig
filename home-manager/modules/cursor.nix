{ pkgs, ... }:

{
	home.packages = with pkgs; [
	  rose-pine-hyprcursor
	];
	
	home.sessionVariables = {
	  HYPRCURSOR_THEME = "rose-pine-hyprcursor";
	  HYPRCURSOR_SIZE = "38";
	};
}
