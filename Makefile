INCLUDES_DIR = /usr/avr/include

# MacPorts puts the headers here
# INCLUDES_DIR = /opt/local/avr/include

all: defines symbols syntax

defines: build/defines

build/defines:
	mkdir -p build
	> $@
	find $(INCLUDES_DIR) -name "*.h" -exec \egrep '#\ *define +[^_ ]+' {} \; | sort | uniq >> $@;
	
symbols: build/symbols

build/symbols: build/defines
	./extract-symbols $< | sort | uniq > $@

syntax: syntax/avr.vim

syntax/avr.vim: build/symbols
	./make-syntax $< | sort | uniq > $@

clean:
	rm syntax/avr.vim build/*
