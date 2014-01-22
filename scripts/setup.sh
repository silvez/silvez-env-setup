#!/bin/bash
################################################################################
# INFO:
################################################################################
# TODO:
# - make script better
# - if repository already exists, update it
################################################################################

git_remote_path="https://github.com/silvez"

git_dir=${HOME}/git/silvez
#git_dir=/tmp/git/silvez

## create git dir if it do not exists
mkdir -p $git_dir && cd $git_dir

dotfiles () {
    git_repo=(
    dotfiles
    )

    ## clone git repos and make symlinks
    counter=1

    #until [ $counter -gt ${#git_repo} ]; do
    for i in ${!git_repo[@]}; do
        git clone ${git_remote_path}/${git_repo[$i]}
        cd ${git_repo[$i]}

            for j in $(find . -maxdepth 1 -not -name "." -and -not -name "*.md" -and -not -name "*.git" -and -not -name "*.swp"); do
                rm -rf ${HOME}/${j} && ln -s $(pwd)/${j} ${HOME}
            done

        cd ..
        #let counter++
    done
}

dotfiles_vim () {
    git_repo=(vim-fugitive vimoutliner vim-pathogen nerdtree)

    vim_plugin_path=${HOME}/.vim/bundle

    ## clone git repos and make symlinks
    counter=1

    #until [ $counter -gt ${#git_repo} ]; do
    for i in ${!git_repo[@]}; do
        git clone ${git_remote_path}/${git_repo[$i]}
        #cd ${git_repo[$counter]}
        rm -rf ${vim_plugin_path}/${git_repo[$i]} && ln -s $(pwd)/${git_repo[$i]} ${vim_plugin_path}

            #for i in $(find . -maxdepth 1 -not -name "." -and -not -name "*.md" -and -not -name "*.git" -and -not -name "*.swp"); do
                #echo rm -rf ${HOME}/${i} && echo ln -s $(pwd)/${i} ${HOME}
            #done

        #let counter++
    done
}

## main
dotfiles
dotfiles_vim
