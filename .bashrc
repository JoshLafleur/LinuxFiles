# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
#if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
#	return
#fi
[ -z "$PS1" ] && return

# Put your fun stuff here.
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias zenbot-0="ssh josh@104.128.64.148"
alias tks="tmux kill-session"

neofetch

export PATH=/home/josh/tools/Xilinx/Vivado/2020.1/bin:$PATH


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/josh/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/josh/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/josh/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/josh/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
#parse_git_branch() {
#     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
#}
#export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

# prompt
FMT_BOLD="\[\e[1m\]"
FMT_DIM="\[\e[2m\]"
FMT_RESET="\[\e[0m\]"
FMT_UNBOLD="\[\e[22m\]"
FMT_UNDIM="\[\e[22m\]"
FG_BLACK="\[\e[30m\]"
FG_BLUE="\[\e[34m\]"
FG_CYAN="\[\e[36m\]"
FG_GREEN="\[\e[32m\]"
FG_GREY="\[\e[37m\]"
FG_MAGENTA="\[\e[35m\]"
FG_RED="\[\e[31m\]"
FG_WHITE="\[\e[97m\]"
BG_BLACK="\[\e[40m\]"
BG_BLUE="\[\e[44m\]"
BG_CYAN="\[\e[46m\]"
BG_GREEN="\[\e[42m\]"
BG_MAGENTA="\[\e[45m\]"

if [ $TERM == "xterm-kitty" ]; then 
PS1="\n ${FG_BLUE}╭─" # begin arrow to prompt
PS1+="${FG_GREEN}" # begin USERNAME container
PS1+="${BG_GREEN}${FG_CYAN}${FMT_BOLD}" # print OS icon
PS1+="${FG_BLACK} \u" # print username
PS1+="${FMT_UNBOLD} ${FG_GREEN}${BG_BLUE} " # end USERNAME container / begin DIRECTORY container
PS1+="${FG_GREY}\w " # print directory
PS1+="${FG_BLUE}${BG_CYAN} " # end DIRECTORY container / begin FILES container
PS1+="${FG_BLACK}"
PS1+=" \$(find . -mindepth 1 -maxdepth 1 -type d | wc -l) " # print number of folders
PS1+=" \$(find . -mindepth 1 -maxdepth 1 -type f | wc -l) " # print number of files
PS1+=" \$(find . -mindepth 1 -maxdepth 1 -type l | wc -l) " # print number of symlinks
PS1+="${FMT_RESET}${FG_CYAN}"
PS1+="\$(git branch 2> /dev/null | grep '^*' | colrm 1 2 | xargs -I BRANCH echo -n \"" # check if git branch exists
PS1+="${BG_GREEN} " # end FILES container / begin BRANCH container
PS1+="${FG_BLACK} BRANCH " # print current git branch
PS1+="${FMT_RESET}${FG_GREEN}\")\n " # end last container (either FILES or BRANCH)
PS1+="${FG_BLUE}╰ " # end arrow to prompt
PS1+="${FG_CYAN}\\$ " # print prompt
PS1+="${FMT_RESET}"
export PS1
fi

if [ $TERM == "xterm-256color" ]; then 
PS1="${BG_GREEN}${FG_CYAN}${FMT_BOLD}" # print OS icon
PS1+="${FG_BLACK} \u" # print username
PS1+="${FMT_UNBOLD} ${FG_GREEN}${BG_BLUE}" # end USERNAME container / begin DIRECTORY container
PS1+="${FG_GREY} \w " # print directory
PS1+="${FG_BLUE}${BG_CYAN}" # end DIRECTORY container / begin FILES container
PS1+="${FG_BLACK} "
PS1+="FO \$(find . -mindepth 1 -maxdepth 1 -type d | wc -l) " # print number of folders
PS1+="FI \$(find . -mindepth 1 -maxdepth 1 -type f | wc -l) " # print number of files
PS1+="LI \$(find . -mindepth 1 -maxdepth 1 -type l | wc -l) " # print number of symlinks
PS1+="${FMT_RESET}${FG_CYAN}"
PS1+="\$(git branch 2> /dev/null | grep '^*' | colrm 1 2 | xargs -I BRANCH echo -n \"" # check if git branch exists
PS1+="${BG_GREEN}" # end FILES container / begin BRANCH container
PS1+="${FG_BLACK} BRANCH " # print current git branch
PS1+="${FMT_RESET}${FG_GREEN}\")\n" # end last container (either FILES or BRANCH)
PS1+="${FG_BLUE}" # end arrow to prompt
PS1+="${FG_CYAN}\\$ " # print prompt
PS1+="${FMT_RESET}"
export PS1
fi
