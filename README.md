# dotfiles

NixOS configs and dotfiles for my personal dev machine.

## Setup Notes

Some additional notes for setting up a fresh NixOS install:

- [ ] Add home-manager channel and update all channels:

```bash
sudo nix-channel --add https://github.com/nix-community/home-manager/archive/release-25.11.tar.gz home-manager
sudo nix-channel --update
```

- [ ] Clone this repo to `.dotfiles`.
- [ ] Import GPG key.
- [ ] Generate new GitHub SSH key.
- [ ] Install private pass database.
- [ ] Need to run `fisher install realiserad/fish-ai` and setup INI config (place
      under `~/.config/fish/fish-ai.ini`):

```ini
[fish-ai]
configuration = github
refined_completions = 5

[github]
provider = self-hosted
server = https://models.inference.ai.azure.com
api_key = <GITHUB_PAT>
model = gpt-4.1
```

- [ ] Need to run `rustup default stable` to install the stable rust toolchain. Also
      need to `rustup component add rust-analyzer`.
- [ ] RuneLite cache is under `~/.local/share/bolt-launcher/.runelite`. Restore
      RuneLite cache from backup.
