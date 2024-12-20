let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-24.05";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in

pkgs.mkShellNoCC {
  packages = with pkgs; [
    cowsay
    lolcat
  ];

  GREETINGS = "Hello, Kai!";
  LC_ALL = "C";

  shellHook = ''
    echo $GREETINGS | cowsay | lolcat
  '';

}
