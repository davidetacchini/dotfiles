## Dotfiles

### Steps

#### 1. Installing

##### MacOS

```sh
brew install git
brew install stow
```

##### Linux

```sh
sudo apt install git stow
```

#### 2. Clone the repo

This must be cloned in the $HOME directory

```sh
git clone git@github.com:davidetacchini/dotfiles.git
```

#### 3. STOW!

Want to ignore some dirs/files? Just create a `.stow-local-ignore` inside the dotfiles directory and enter all the files you want stow to ignore. Then:

```sh
cd dotfiles
stow .
```

### Resources
https://www.gnu.org/software/stow/
