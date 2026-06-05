OCAMLOPT = ocamlopt

NAME = app

SOURCES = \
	ex00/ft_test_sign.ml \
	tests/test_ft_sign.ml \
	main.ml

INCLUDES = \
	-I ex00 \
	-I tests

all: $(NAME)

$(NAME): $(SOURCES)
	$(OCAMLOPT) $(INCLUDES) -o $(NAME) $(SOURCES)

run: all
	./$(NAME)

clean:
	rm -f ex00/*.cmi ex00/*.cmx ex00/*.o
	rm -f tests/*.cmi tests/*.cmx tests/*.o
	rm -f *.cmi *.cmx *.o

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all run clean fclean re
