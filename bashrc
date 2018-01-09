## SET UP PATH

export LOCAL=${HOME}/.local

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
