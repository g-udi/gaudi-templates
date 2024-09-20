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

### Software Lists
 - Main lists that are picked up by the "first-class" installers `default.<SOFTWARETARGET>.list.sh` e.g. `default.brew.list.sh`
 - Custom lists `<ANY>.<SOFTWARETARGET>.list.sh` e.g. `development.brew.list.sh`

The list file needs to export a variable with the name of the list, e.g. `export brewList=(...)`.

There are few additional attributes you can set on the list:

 - `@Name`: The name of the list, this is used to identify the list in the logs and in the hooks.
 - `@Description`: A short description of the list, this is used to describe the list in the logs.
 - `@List`: The name of the variable that contains the list, this is used to identify the list in the script.

The software list is an array of strings, where each string represents a software to install. Each string is in the following format:

`"<MODULE>@<VERSION>::<DESCRIPTION>"`

The `<MODULE>` is the name of the module to install, this is the name of the software to install.

The optional `<VERSION>` is the version of the software to install, this is optional and can be used to specify the version of the software to install.

The optional `<DESCRIPTION>` is a short description of the software to install, this is optional and can be used to provide a short description of the software to install.

```sh
# @Name: Default
# @List: brewList
export brewList=(

  # Core Modules
  
  "coreutils::with_default_names::GNU File, Shell, and Text utilities"
  "autoconf@2.13::Automatic configure script builder"
  "grep::GNU grep, egrep and fgrep"
  ...
)
```

### hooks
 - Pre hooks that are executed before the software lists are installed `pre.<SOFTWARETARGET>.hooks.sh` e.g. `pre.brew.hooks.sh`
 - Post hooks that are executed after the software lists are installed `post.<SOFTWARETARGET>.hooks.sh` e.g. `post.brew.hooks.sh`

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

