## Setup for Ubuntu based distributions

Setup For Linux Mint

`wget -qO- https://git.io/JUxiR | sh`

For minimal setup

`wget -qO- https://bit.ly/owl-kde-setup | sh`

OR

`chmod +x setup.sh`

`./setup.sh`

## For directory and git branch in bash terminal

```
parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
if [ "$color_prompt" = yes ]; then
 PS1='\[\033[01;32m\]\w \[\033[01;33m\]$(parse_git_branch)\n\[\033[01;32m\]\$\[\033[00m\] '
else
 PS1='\w $(parse_git_branch)\n\$ '
fi
unset color_prompt force_color_prompt
```
