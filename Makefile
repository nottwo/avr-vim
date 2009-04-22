INCLUDES_DIR = /usr/avr/include

all: defines symbols syntax

defines: .vim-defines

.vim-defines:
	find $(INCLUDES_DIR) -name "*.h" -exec \egrep '#\ *define +[^_ ]+' {} \; | sort | uniq >> defines;
	@touch .vim-defines
	
symbols: .vim-symbols

.vim-symbols: defines
	./extract-symbols defines | sort | uniq > defines.uniq
	@touch .vim-symbols

syntax: .vim-syntax

.vim-syntax: defines.uniq
	./make-syntax defines.uniq | sort | uniq > avr.vim
	@touch .vim-syntax

clean:
	rm avr.vim .vim-* defines.uniq defines
