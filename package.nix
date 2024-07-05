{
  buildGoModule,
  lib
}: buildGoModule {
  pname = "matrix-wiki";
  version = "0.1.0";
  
  src = ./.;
  vendorHash = "sha256-aeEhrfeJv7+v5K0eKJE2hFa9Vj9FzjmytNZlKQ1I/Og=";
  
  meta = {
    description = "Unofficial matrix wiki";
    homepage = "https://github.com/sleroq/matrix-wiki";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ sleroq ];
  };
}
