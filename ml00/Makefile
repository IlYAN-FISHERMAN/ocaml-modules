OCAMLOPT = ocamlopt

NAME = app

SOURCES = \
	ex00/ft_test_sign.ml \
	ex01/ft_countdown.ml \
	tests/test_ft_sign.ml \
	tests/test_ft_countdown.ml \
	main.ml

INCLUDES = \
	-I ex00 \
	-I ex01 \
	-I ex02 \
	-I ex03 \
	-I ex04 \
	-I ex05 \
	-I ex06 \
	-I ex07 \
	-I ex08 \
	-I tests

all: $(NAME)

$(NAME): $(SOURCES)
	@$(OCAMLOPT) $(INCLUDES) -o $(NAME) $(SOURCES)

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
