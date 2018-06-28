{ stdenv, buildGoPackage, fetchgit }:

buildGoPackage rec {
  name = "holochain-go${version}";
  version = "v0.1.0-alpha";
  rev = "a17510b910a7a377441c152b8dccdbae1999f63f";

  goPackagePath = "github.com/holochain/holochain-proto";


  src = fetchgit {
    inherit rev;
    url = "https://github.com/holochain/holochain-proto";
    sha256 = "19l29jnr63ximmyn4i4llv2mdwh306c2mpzmx2anj9z12wjpach0";
  };

  goDeps = ./deps.nix;

  # TODO: add metadata https://nixos.org/nixpkgs/manual/#sec-standard-meta-attributes
  meta = {
    description = "core implementation of validating DHT dApps in go";
    longDescription = "Holographic storage for distributed applications -- a validating monotonic DHT backed by authoritative hashchains for data provenance";
    homepage = "https://holochain.org/";
    downloadpage = "https://developer.holochain.org/";
    license = stdenv.lib.licenses.gpl3;
    maintainers = with stdenv.lib.maintainers; [ gavin ];
    platforms = stdenv.lib.platforms.all;

  };
}
