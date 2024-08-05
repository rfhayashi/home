# Home-manager configuration

## Installation

### Install Nix

```shell
sh <(curl -L https://nixos.org/nix/install) --daemon

```

### Install Home-manager

```shell
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager

nix-channel --update

nix-shell '<home-manager>' -A install

```

### Enable flakes

Add:

```
experimental-features = nix-command flakes
```

to `/etc/nix/nix.conf`.

and restart the daemon.

```shell
sudo sytemctl restart nix-daemon
```

### Clone this repo

```
nix-shell -p git
git clone git@github.com:rfhayashi/home.git
exit
```

### Switch home-manager configuration

```
cd home
home-manager switch --flake .
```
