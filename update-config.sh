# Checks to see if dotfiles are ahead/behind of remote master. If they're
# ahead, suggest pushing. If they're behind, pull and update vim config. If
# they're even, do nothing.

dotfiles_dir=$HOME/dotfiles
vim_config_path=$HOME/.config/nvim/init.vim

if [ -d $HOME/dotfiles ]; then

    cd $dotfiles_dir

    $(git fetch)

    ahead=$(git rev-list --count origin/master..master)
    behind=$(git rev-list --count master..origin/master)

    if [ $ahead != 0 ]; then
        echo "dotfiles ahead by $ahead commit(s). Consider pushing!"
    elif [ $behind != 0 ]; then
        echo "dotfiles behind by $behind commits. Pulling..."

        echo $(git pull)

        echo "Updating vim config..."

        $(cp $dotfiles_dir/init.vim $vim_config_path)

        echo "Done!"
    else
        echo "dotfiles up to date!"
    fi

    cd
fi
