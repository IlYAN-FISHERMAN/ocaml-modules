let () = 
    Random.self_init();

    let tab = [|"Pourquoi les plongeurs plongent-ils toujours en arrière et jamais en avant ?
     - Parce que sinon ils tombent dans le bateau";
    "Que dit une imprimante dans l'eau ?
      - J'ai papier";
    "Pourquoi les vaches ferment les yeux quand elles mangent ?
      - Parce qu'elles ont du lait concentré";
    "C’est l’histoire d’un aveugle...
      - ... qui rentre dans un bar, puis une table, puis une chaise...";
     "Un piano à un autre : « Hey, ça va ? »
      -L’autre : « Non, j’ai mal au do ! »"
    |] in
        print_endline tab.(Random.int (Array.length tab))
