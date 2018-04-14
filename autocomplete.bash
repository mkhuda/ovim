_dircompletion() 
{
    local cur prev setdir
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    # change this to your expected root of projects folder
    ################################
    lsdir=`ls /home/your/project/somewhere`
    ################################
    setdir=${lsdir}
    if [[ ${cur} == * ]] ; then
        COMPREPLY=( $(compgen -W "${setdir}" -- ${cur}) )
        return 0
    fi
}
complete -F _dircompletion ovim

ovim() {
    cd /home/your/project/"$1" && vim
}

