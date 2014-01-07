#!/bin/bash

git_remote_path="https://github.com/silvez"
git_repo=(
dotfiles
vim-fugitive
vimoutliner
vim-pathogen
nerdtree
)
git_dir=${HOME}/git/silvez

## create git dir if it do not exists
echo mkdir -p $git_dir && cd $git_dir

## clone git repos and make symlinks
counter=1

until [ $counter -gt ${#git_repo} ]; do
    echo git clone ${git_remote_path}/${git_repo[$counter]}
    cd ${git_repo[$counter]}

        for i in $(find . -maxdepth 1 -not -name "." -and -not -name "*.md" -and -not -name "*.git" -and -not -name "*.swp"); do
            echo rm -rf ${HOME}/${i} && echo ln -s $(pwd)/${i} ${HOME}
        done

    let counter++
done
