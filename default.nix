let
  overlays = let
    graalvm = self: super:
      let
        jre = self.callPackage ./graalvm { };
        jdk = jre;
      in {
        inherit jre jdk;
        scala = super.scala.override { inherit jre; };
      };
    bloop = self: super: {
      bloop = self.callPackage ./derivations/bloop.nix {
        version = "1.4.6-15-209c2a5c";
      };
    };
  in [ graalvm bloop ];
  pkgs = import <nixpkgs> { inherit overlays; };
in with pkgs; [ jdk sbt scala ammonite scalafmt coursier bloop ]
