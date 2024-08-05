{ stdenv, lib, fetchzip, makeWrapper, openjdk, coreutils, bash, ... } :

stdenv.mkDerivation (finalAttrs: {
  pname = "gcap";
  version = "1.2";

  src = fetchzip {
    url = "https://downloadirpf.receita.fazenda.gov.br/irpf/2024/gcap/GCAP2024v1.2.zip";
    sha256 = "sha256-c6JzAnm/fRF9ppc/FYrJCv4zq9mhqln97vf/aTi3scU=";
  };

  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    cp -R * $out
    cat <<EOF > $out/bin/gcap
    #! ${bash}/bin/bash
    ${openjdk}/bin/java -Xmx2048M -jar $out/GCAP.jar
    EOF
    chmod +x $out/bin/gcap
    runHook postInstall
  '';

})
