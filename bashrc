## SET UP PATH

export LOCAL=${HOME}/.local
export GOPATH=usr/local/go
export PATH=$PATH:$GOPATH/bin

AddPath ()
# Add argument to $PATH if:
# - it is not already present
# - it is a directory
# - we have execute permission on it
{
  _folder=$1
  echo " $PATH " | sed 's/:/ /g' | grep " $_folder " > /dev/null
  [ $? -ne 0 ] && [ -d $_folder ] && [ -x $_folder ] && PATH=$_folder:$PATH
  export PATH
}

# Add some paths. Last excecuted is first in line in path
AddPath /usr/bin
AddPath /usr/local/bin
AddPath $HOME/.local/bin
AddPath ${HOME}/.local/go/bin
AddPath /usr/local/opt/llvm/bin

# Add anaconda, with functions to add and remove as you like
function unconda {
    export PATH=`echo ":${PATH}:" | \
    sed -e "s:\:$HOME/.local/conda/bin\::\::g" -e "s/^://" -e "s/:$//"`
}
function reconda {
    export PATH="$HOME/.local/conda/bin:$PATH"
}
reconda

alias ls='ls -a'

## PROMPT
# color_name='\[\033[ color_code m\]'

rgb_restore='\[\033[00m\]'
rgb_red='\[\033[01;31m\]'
rgb_forest='\[\033[00;32m\]'
rgb_gray='\[\033[00;37m\]'

if [ `id -u` -eq 0 ]
then
    rgb_usr="${rgb_red}"
else
    rgb_usr="${rgb_forest}"
fi

PROMPT_COMMAND="printf '\n'"
[ -n "$PS1" ] && PS1="${rgb_usr}\u@\h ${rgb_red}\w\n${rgb_gray}$ ${rgb_restore}"

unset   rgb_restore   \
        rgb_red       \
        rgb_forest    \
        rgb_usr       \
        rgb_gray
