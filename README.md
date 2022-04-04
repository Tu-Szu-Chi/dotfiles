# Install everything at once
```bash
stow --verbose --target=$HOME --restow */
```
## Delete
```bash
stow --verbose --target=$HOME --delete */
```

The --restow parameter tells stow to unstow the packages first before stowing them again, which is useful for pruning obsolete symlinks from the target directory.
