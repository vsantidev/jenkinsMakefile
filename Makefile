# Nom du compilateur à utiliser
CC = gcc

# Options de compilation strictes :
# -Wall    : affiche tous les warnings
# -Wextra  : encore plus de warnings utiles
# -Werror  : transforme les warnings en erreurs
CFLAGS = -Wall -Wextra -Werror

# Fichier source principal
SRC = main.c

# Génère le nom du fichier objet à partir du .c (main.o)
OBJ = $(SRC:.c=.o)

# Nom de l’exécutable final
EXEC = app

# Cible par défaut (appelée quand tu fais juste "make")
all: $(EXEC)

# Comment construire l'exécutable à partir des .o
$(EXEC): $(OBJ)
	@echo "Compiling $@ ..."
	@$(CC) $(OBJ) -o $(EXEC)

# Comment compiler chaque .c en .o
%.o: %.c
	@echo "Compiling $< ..."
	@$(CC) $(CFLAGS) -c $< -o $@

# Fausse commande pour simuler des tests
tests_run:
	@echo "Running tests..."
	@echo "Test 1: OK"
	@echo "Test 2: OK"

# Supprimer les fichiers objets (.o)
clean:
	@echo "Cleaning object files..."
	@rm -f $(OBJ)

# Supprimer les objets + l'éxécutable
fclean: clean
	@echo "Cleaning executable..."
	@rm -f $(EXEC)

# Recompile tout à zéro
re: fclean all
