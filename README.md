# DOTFILES DOC

## PACKAGE LIST

## HOW TO RESTORE
<code>alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'</code> <br>
<code>git clone --bare git@github.com:yourgithubusername/your-dot-files-repo.git $HOME/.dotfiles</code> <br>

<code>dotfiles config --local status.showUntrackedFiles no</code> <br>
<code>dotfiles checkout</code> <br>

<p>If you already have some of the dotfiles present, you will see this error.</p>

<code>
  error: The following untracked working tree files would be overwritten by checkout: .bashrc
  Please move or remove them before you switch branches.
  Aborting

  Remove or backup any collisions and repeat the checkout.
</code>

<code>mv ~/.bashrc ~/.bashrc_backup</code> <br>
<code>dotfiles checkout</code> <br>

<b>👌 DONE</b>
