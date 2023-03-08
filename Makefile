all: lexer.ml main.ml
	ocamlbuild -tag use_str main.native

clean:
	ocamlbuild -clean
