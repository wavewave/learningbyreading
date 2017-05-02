{ pkgs ? import <nixpkgs> {}
}:

with pkgs;

let 
    newHaskellPackages = haskellPackages;
    hsenv = newHaskellPackages.ghcWithPackages (p: with p; [
              attoparsec lens split text monad-loops
            ]);
    python-graph-core = python27Packages.buildPythonPackage rec {
      name = "python-graph-core-${version}";
      version = "1.8.2";
      src = pkgs.fetchurl {
        url = "mirror://pypi/p/python-graph-core/${name}.tar.gz";
        sha256 = "08gw8wizckkq4ig90zp20j8hxzjjxkx7lddi5nvaigxk89gs8gsh";
      };
      buildInputs = [];
      propagatedBuildInputs = [ ];
      doCheck = false;
      meta = {
      };
    };


in stdenv.mkDerivation {
  name = "textview-dev";
  buildInputs = [ swiProlog flex gsoap ]
                ++ (with python27Packages; [
                     simplejson requests lxml nltk python-graph-core
                     rdflib
                   ]);
  shellHook = ''
  '';
}
