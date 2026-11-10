# Gaudi Templates

This repository contains templates that can be used to install software on your machine via the [Gaudi](https://github.com/g-udi/gaudi) installation tool.

 🏗️ Automate your machine setup
 🎨 Customize with templates
 🚀 From fresh install to fully equipped in minutes

Gaudi turns the chore of configuring a new machine into a breeze. Define your ideal development environment once, deploy it anywhere, anytime.

## Why Gaudi?

Setting up a new machine can be a tedious, time-consuming process. Gaudi solves this by automating:

- Software installation (brew, npm, mas, etc.)
- System preferences customization
- Application setup
- Configuration matching

## Getting Started

To get started with Gaudi, follow the instructions in the [Gaudi README](https://github.com/g-udi/gaudi/blob/master/README.md).

# The Templates

There are three types of templates:

 - Software lists: These templates are used to install software on your machine.
 - Hooks: These templates are used to run code before or after the software lists are installed.
 - Configs: These templates are used to configure your machine.

Files inside these folders are picked up automatically by Gaudi and executed during the installation process given you follow the correct naming conventions.

## Naming Conventions

### Software: Brewfiles

Software is declared in [Brewfiles](https://docs.brew.sh/Brew-Bundle-and-Brewfile). Gaudi picks up every file named `Brewfile` or `<name>.Brewfile`, asks whether to install it, and runs `brew bundle install` on it.

One Brewfile can hold Homebrew taps, formulae and casks, Mac App Store apps, VS Code extensions, and npm, Go, Cargo and uv packages. Split them by purpose so each can be accepted or skipped on its own:

| File | Contents |
| --- | --- |
| `lists/core.Brewfile` | Command-line tools and libraries |
| `lists/languages.Brewfile` | Language version managers |
| `lists/apps.Brewfile` | Desktop applications (casks) |
| `lists/appstore.Brewfile` | Mac App Store apps |
| `lists/npm.Brewfile` | Global npm packages |
| `lists/python.Brewfile` | Python tools, installed with [uv](https://docs.astral.sh/uv/) |

Two optional comment lines at the top name and describe the file in the prompts:

```ruby
# @Name: Core tools
# @Description: Command-line tools and libraries installed with Homebrew

tap "koekeishiya/formulae"

# GNU File, Shell, and Text utilities
brew "coreutils"
# Lightweight and flexible command-line JSON processor
brew "jq"
cask "raycast"
mas "Amphetamine", id: 937984704
npm "eslint"
uv "pylint"
```

To capture the current machine as a Brewfile, run `gaudi backup`.

### Software: lists for other package managers

Package managers Homebrew does not drive keep the list format: `<name>.apt.list.sh` (Debian/Ubuntu) and `<name>.gem.list.sh`.

```sh
# @Name: Default
# @List: aptList
aptList=(
  "build-essential"
  "pkg-config::Manage compile and link flags for libraries"
)
```

 - `@Name`: shown in the prompts.
 - `@Description`: optional short description.
 - `@List`: the name of the array variable that holds the entries.

Each entry is `"<PACKAGE>::<DESCRIPTION>"`; the description is optional.

### Hooks

Hooks are shell scripts that Gaudi sources around the software steps. The file name decides when they run:

| File name | Runs |
| --- | --- |
| `pre.bundle.hooks.sh` / `post.bundle.hooks.sh` | Before the first / after the last Brewfile |
| `pre.bundle-<name>.hooks.sh` / `post.bundle-<name>.hooks.sh` | Around `<name>.Brewfile`, only if it was accepted |
| `post.bundle-<name>.<topic>.hooks.sh` | Same, when one Brewfile needs several hooks (e.g. `post.bundle-core.asdf.hooks.sh`) |
| `pre.apt.hooks.sh`, `post.gem.hooks.sh`, ... | Around the apt and gem lists |

A hook that fails is reported at the end of the run; it does not stop the setup.

### Configs

Configs are used to configure your machine. They are executed after the software lists are installed.

There are few additional attributes you can set on the config:

 ```sh
 _info="Disable automatic capitalization while typing"
function _command {
    defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
}
```

 - `_info`: A short description of the config, this is used to describe the config in the logs.
 - `_command`: The command to execute, this is the command to execute to configure the machine.


### Dotfiles

`dotfiles.list` names the files and directories `gaudi backup` copies, one per line, relative to the home directory. Files placed under `dotfiles/` at the top of the repository are restored by `gaudi setup` with the same layout. Do not list secrets while the repository is public.

### Other package managers

Besides Brewfiles, lists are supported for `apt` (Debian/Ubuntu), `dnf` (Fedora) and `gem`: `<name>.apt.list.sh`, `<name>.dnf.list.sh`, `<name>.gem.list.sh`.

## Checking the templates

```sh
gaudi check .
gaudi check . --online
```

`gaudi check` reports hooks and configs whose names mean they never run, Brewfiles Homebrew cannot read, and lists without their array. A [GitHub Actions workflow](.github/workflows/check.yml) runs it on every pull request and push; require its `templates check` check on `master` to block merging broken templates.

Lists also exist for Arch (`<name>.pacman.list.sh`) and openSUSE (`<name>.zypper.list.sh`), and configs can target `arch` and `opensuse`.
