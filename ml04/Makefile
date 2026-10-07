SWITCH ?= ocaml-clean
EX ?= ex00
MAIN ?= main

DUNE = opam exec --switch=$(SWITCH) -- dune

build:
	$(DUNE) build

watch:
	$(DUNE) build -w

run:
	$(DUNE) exec $(EX)/$(MAIN).exe

clean:
	$(DUNE) clean

fmt:
	$(DUNE) fmt

check:
	$(DUNE) build @check

utop:
	$(DUNE) utop

tree:
	find . -maxdepth 3 -type f | sort

new-ex:
	mkdir -p $(EX)
	printf '(executable\n (name $(MAIN))\n (modules $(MAIN)))\n' > $(EX)/dune
	printf 'let () = print_endline "Hello from $(EX)"\n' > $(EX)/$(MAIN).ml

.PHONY: build watch run clean fmt check utop tree new-ex
