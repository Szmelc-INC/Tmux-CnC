{
  description = "Command & Control interface for tmux sessions";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f nixpkgs.legacyPackages.${system});
    in
    {
      packages = forAllSystems (pkgs: rec {
        tmuxcnc = pkgs.stdenv.mkDerivation {
          pname = "tmuxcnc";
          version = "0-unstable-${self.shortRev or self.dirtyShortRev or "dirty"}";
          src = ./.;
          dontBuild = true;
          installPhase = ''
            runHook preInstall
            install -Dm755 tmuxcnc.sh $out/bin/tmuxcnc
            install -Dm644 LICENSE $out/share/licenses/tmuxcnc/LICENSE
            runHook postInstall
          '';
          meta = {
            description = "Command & Control interface for tmux sessions";
            homepage = "https://github.com/Szmelc-INC/Tmux-CnC";
            license = pkgs.lib.licenses.mit;
            mainProgram = "tmuxcnc";
            platforms = pkgs.lib.platforms.linux;
          };
        };
        default = tmuxcnc;
      });

      apps = forAllSystems (pkgs: {
        default = {
          type = "app";
          program = "${self.packages.${pkgs.stdenv.hostPlatform.system}.default}/bin/tmuxcnc";
        };
      });
    };
}
