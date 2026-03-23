{pkgs, ...}: {
  # enables vm
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

  users.users.azea.extraGroups = ["libvirtd" "kvm"];

  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
    qemu_kvm
  ];
}
