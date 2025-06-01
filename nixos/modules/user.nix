{
  config,
  pkgs,
  username,
  ...
}:

{
  # Define user account
  users.users.${username} = {
    isNormalUser = true;
    description = username;
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
    ];
  };
}
