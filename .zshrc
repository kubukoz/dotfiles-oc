# Alright then, keep your secrets
source ~/.secrets.zsh

function check_env() {
  name=$1
  ! test -z ${(P)name} || echo "Missing $name"
}

check_env GITLAB_PRIVATE_TOKEN
check_env NEXUS_USERNAME
check_env NEXUS_PASSWORD
check_env OCEAN_NEXUS_USERNAME
check_env OCEAN_NEXUS_PASSWORD
check_env ATM_NEXUS_USER
check_env ATM_NEXUS_PASSWORD
check_env CHANCELLOR_TOKEN
check_env KUP_TOKEN
check_env KUP_USER_ID
check_env KUP_USER_NAME
check_env SONATYPE_USERNAME
check_env SONATYPE_PASSWORD
check_env GIT_API_TOKEN


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
#yeah sure -jk
export SDKMAN_DIR="/Users/j.kozlowski/.sdkman"
[[ -s "/Users/j.kozlowski/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/j.kozlowski/.sdkman/bin/sdkman-init.sh"

############################################
# nix
############################################

# add nix
source /Users/j.kozlowski/.nix-profile/etc/profile.d/nix.sh

source $HOME/.nix-profile/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
alias nss="nix-shell"
############################################







############################################
# zsh config
############################################

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.)must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH="$HOME/bin\
:/usr/local/bin\
:/Users/j.kozlowski/.local/bin\
:/Users/j.kozlowski/Library/Application Support/Coursier/bin\
:$PATH"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_MODE="awesome-patched"

HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"

plugins=(
  fzf-tab
  fzf-history
  zsh-ipfs
  git
  zsh-autosuggestions
  docker
  docker-compose
  kubectl
  nix-zsh-completions
)

source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# font
export LC_CTYPE="en_US.UTF-8"

############################################








############################################
# nix completions
############################################

fpath=(~/.nix-profile/share/zsh/site-functions $fpath)

autoload -U compinit
compinit

############################################







############################################
# aliases
############################################

alias psql=pgcli
alias lsd="exa --long --header --git --all"
alias dps="docker-compose ps"
alias dcp="docker-compose"

############################################







############################################
# ocado stuff
############################################

OCADO_NEXII="nexus.ocado.tech"

OCEAN_NEXUS_HOST="ocean.$OCADO_NEXII"
OSP_NEXUS_HOST="ospcfc.$OCADO_NEXII"

export COURSIER_REPOSITORIES="ivy2Local\
|central\
|sonatype:releases\
|sonatype:snapshots\
|https://$OCEAN_NEXUS_HOST/repository/maven-releases\
|https://$OSP_NEXUS_HOST/repository/maven-release-group"

export COURSIER_CREDENTIALS="\
$OCEAN_NEXUS_HOST(Ocean Nexus) $OCEAN_NEXUS_USERNAME:$OCEAN_NEXUS_PASSWORD\
$OSP_NEXUS_HOST(OSP Nexus) $OCEAN_NEXUS_USERNAME:$OCEAN_NEXUS_PASSWORD"

export PACT_BROKER_URL_REAL='http://euw1-ospnowpactbroker.eu-west-1.aws.shd.dev.lastmile.com'

export NODE_EXTRA_CA_CERTS=~/certs/lastmile-root.pem

############################################






export PATH=/Users/j.kozlowski/.local/share/fury/bin:/Users/j.kozlowski/.local/share/fury/opt:$PATH # Added by Fury
fpath=(/Users/j.kozlowski/.local/share/fury/usr/0.18.9/script /Users/j.kozlowski/.local/share/fury/completions $fpath) # Added by Fury
autoload -U compinit && compinit # Added by Fury
