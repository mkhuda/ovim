# OVIM (aka) Open VIM

Bash alias for creating autocomplete command in UNIX terminal to open VIM on some project directory.

## Installing
- Clone this repo
```bash
$ git clone https://github.com/mkhuda/ovim.git
```
- Copy the content of autocomplete.bash to your `.bashrc`
```bash
$ cd ovim

$ cat autocomplete.bash >> ~/.bashrc
```
- Edit `.bashrc` to adjust the ovim command

```bash
_dircompletion() 
{
    local cur prev setdir
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    # change this to your expected root of projects folder
    ################################
    lsdir=`ls /home/your/project/`
    ################################
    setdir=${lsdir}
    if [[ ${cur} == * ]] ; then
        COMPREPLY=( $(compgen -W "${setdir}" -- ${cur}) )
        return 0
    fi
}
complete -F _dircompletion ovim

ovim() {
    # change this too
    #################################
    cd /home/your/project/"$1" && vim
    #################################
}
```
- Finally, type `source .bashrc`

 ## Usage

Wherever you are in somewhere directory, you can type `ovim<space><tab><tab>` or  `ovim<space><word><tab>` to see the list of your projects or folders setted up from dir.

## Todo
- Shell auto installation (0)
- Provide sample (0)
