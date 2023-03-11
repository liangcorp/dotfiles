    # Bash: when in a git repository, show the current branch, indicate if the working directory is clean or not.
    bold=$(tput bold)
    normal=$(tput sgr0)

    function __set_my_prompt
    {
       local RED="\033[01;31m"
       local GREEN="\033[01;32m"
       local NOCOLOR="\033[0m"
       local YELLOW="\033[01;33m"
       local BLACK="\033[01;30m"

       local git_modified_color="\[${GREEN}\]"
       local git_status=$(git status 2>/dev/null | grep "Your branch is ahead" 2>/dev/null)
       if [ "$git_status" != "" ]
       then
           git_modified_color="\[${YELLOW}\]"
       fi
       local git_status=$(git status --porcelain 2>/dev/null)
       if [ "$git_status" != "" ]
       then
           git_modified_color="\[${RED}\]"
       fi

       local git_branch=$(git branch --show-current 2>/dev/null)
       if [ "$git_branch" != "" ];
       then
          git_branch="($git_modified_color$git_branch\[${NOCOLOR}\]) "
       fi
       PS1="\u:\W$git_branch\[${NOCOLOR}\]\$ "
    }

    PROMPT_COMMAND='__set_my_prompt'
