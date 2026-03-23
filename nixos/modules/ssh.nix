{
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = false;
      PermitRootLogin = "no";
    };
  };

  networking.firewall.allowedTCPPorts = [22];

  users.users.azea = {
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICPD/CSFv14RwbX2wj+YHJJVYGLYjLZtCdcik1t223a6 aurel@aurel-pc"
    ];
  };
}
