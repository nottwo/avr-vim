INCLUDES_DIR = /opt/local/avr/include

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
	./make-syntax defines.uniq | sort | uniq > syntax/avr.vim
	@touch .vim-syntax

clean:
	rm .vim-* defines.uniq defines
