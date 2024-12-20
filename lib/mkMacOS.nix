{ inputs, ... }: {
  mkMacOS = { macModule, homeModule, nixModule, system, hostname }:
    let
      kernel-modules = import ../modules/kernel;
      home-modules = import ../modules/home;
      nix-modules = import ../modules/nix;

    in inputs.nix-darwin.lib.darwinSystem {
      specialArgs = { inherit system; };
      modules = [
        nix-modules
        nixModule
        inputs.home-manager.darwinModules.home-manager
        {
          users.users.${hostname}.home = "/Users/${hostname}";
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.${hostname} = {
              imports = [
                #inputs.nixvim.homeManagerModules.nixvim
                home-modules
                homeModule
              ];
            };
          };
        }
        kernel-modules
        macModule
      ];
    };
}
