local ret_status="%(?:%{$fg_bold[green]%}➜:%{$fg_bold[red]%}➜)"

# python version info
local python_version_info='$(python_version_prompt_info)'
python_version_prompt_info() {
  if command -v python > /dev/null 2>&1; then
    PYTHON_VERSION="$(python -V 2>&1)"
    PYTHON_VERSION=${PYTHON_VERSION/Python /Python}
    PYTHON_VERSION=${PYTHON_VERSION/ */}
    CONDA_DEFAULT_ENV_NAME=''
    if [ -n "$CONDA_DEFAULT_ENV" ]; then
      CONDA_DEFAULT_ENV_NAME="$CONDA_DEFAULT_ENV::"
    fi
    echo -n " %{$fg[yellow]%}(${CONDA_DEFAULT_ENV_NAME}${PYTHON_VERSION})%{$reset_color%}"
  fi
}

if [ `whoami` = "root" ]; then
        local current_user="%{$fg_bold[magenta]%}%n"
else
        local current_user="%{$fg_bold[blue]%}%n"
fi

PROMPT="\
%{$fg[white]%}[%*]\
${python_version_info}
${current_user}\
%{$reset_color%}\
${ret_status} \
%{$fg[cyan]%}%c%{$reset_color%}"
PROMPT+=' $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
