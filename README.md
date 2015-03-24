avr-vim is a small set of scripts that extracts information from the
avr-libc header files to create a Vim syntax file.

Depending on where your avr-libc include directory is, you may need to
modify the INCLUDES_DIR variable in the Makefile.

```make all``` will generate a new syntax file from the current avr-libc
installation.

The scripts create three AVR-related Vim syntax groups from #defines in
the avr-libc header files:

* AVR_ISR for AVR interrupt vectors linked to the Macro syntax group
* AVR_function for #defines that act like functions linked to the
  Function syntax group
* AVR_define for all other #defines linked to the Define syntax group

Your color scheme will hopefully do something sensible with those, but
you can of course customize the highlight for them yourself.

### Installation
This repository is a [https://github.com/tpope/vim-pathogen](Pathogen)
bundle.  With Pathogen installed, you can easily install avr-vim:

```sh
cd ~/.vim/bundle
git clone git://github.com/nottwo/avr-vim.git
```

avr-vim ships with a Vim syntax file for avr-libc, but you should
regenerate it for the version of avr-libc you are working with.

### Known deficiencies
Only #defines are extracted, so actual library functions such as the
standard library _P variant functions are currently missing.

### Future improvements
Break out syntax files for individual parts.  If you use a peripheral
name that is not present for the declared device, the coloring will show
it.
