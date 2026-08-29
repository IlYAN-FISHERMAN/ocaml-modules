# nombre de combinaisons : doit donner 4950
dune exec ex09/main.exe | tr ',' '\n' | wc -l

# début et fin exacts
dune exec ex09/main.exe | head -c 30
dune exec ex09/main.exe | cat -e | tail -c 20

# aucune combinaison où gauche >= droite
dune exec ex09/main.exe | tr ',' '\n' | awk '$1 >= $2'   # doit être vide

# pas de doublons
dune exec ex09/main.exe | tr ',' '\n' | sort | uniq -d   # doit être vide
