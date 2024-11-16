import 'package:my_puzzle/src/domain/models/question.dart';

List<Question> getQuestions() {
  return [
    Question(
        question:
            "¿Qué especie de anfibio, conocida por su color dorado, se extinguió en el noreste de Colombia?",
        options: ["Rana de Cristal", "Rana Toro", "Sapo Dorado", "Sapo Verde"],
        correctAnswerIndex: 2,
        info:
            "El Sapo Dorado, de nombre científico Incilius periglenes, es conocido por su color dorado. Se extinguió debido al cambio climático y pérdida de hábitat.",
        difficulty: Difficulty.easy,
        imagePath: "assets/animals/sapo_dorado.jpg",
        nombreCientifico: "Incilius periglenes"),
    Question(
        question:
            "¿Qué especie de pato rara vivía en los ríos de bosques tropicales de la Amazonía?",
        options: ["Pato Serrucho", "Pato Real", "Pato Azulón", "Pato Colorado"],
        correctAnswerIndex: 0,
        info:
            "El Pato Serrucho (Mergus octosetaceus) vivía en los ríos de la Amazonía. Desapareció por la destrucción de su hábitat.",
        difficulty: Difficulty.easy,
        imagePath: "assets/animals/pato_serrucho.jpeg",
        nombreCientifico: "Mergus octosetaceus"),
    Question(
        question:
            "¿Qué ave terrestre habita en zonas montañosas de los Andes colombianos?",
        options: [
          "Cóndor Andino",
          "Guacharaca",
          "Perdiz Andina",
          "Tinamú Andino",
        ],
        correctAnswerIndex: 3,
        info:
            "El Tinamú Andino (Nothoprocta curvirostris) es un ave que habita en las zonas montañosas de los Andes.",
        difficulty: Difficulty.easy,
        imagePath: "assets/animals/tinamu_andino.jpg",
        nombreCientifico: "Nothoprocta curvirostris"),
    Question(
      question:
          "¿Qué mamífero acuático habita en los ríos de la Amazonía y el Orinoco?",
      options: ["Delfín Rosado", "Nutria Gigante", "Tortuga Baula", "Manatí"],
      correctAnswerIndex: 1,
      info:
          "La Nutria Gigante (Pteronura brasiliensis) es un mamífero acuático que habita en ríos de la Amazonía y el Orinoco.",
      difficulty: Difficulty.easy,
      imagePath: "assets/animals/nutria_gigante.jpg",
      nombreCientifico: "Pteronura brasiliensis",
    ),
    Question(
      question:
          "¿Cuál es el principal depredador del Pecarí de Collar en Colombia?",
      options: ["Águila", "Serpiente", "Jaguar", "Oso andino"],
      correctAnswerIndex: 2,
      info:
          "El Pecarí de Collar (Pecari tajacu) es presa del jaguar en su hábitat natural.",
      difficulty: Difficulty.easy,
      imagePath: "assets/animals/pecari_de_collar.jpeg",
      nombreCientifico: "Pecari tajacu",
    ),
    Question(
        question:
            "¿Qué especie de mono, conocido por sus largas extremidades, vive en los bosques de la región Caribe?",
        options: [
          "Mono Araña Cafecíneo",
          "Mono Aullador",
          "Mono Tití",
          "Mono Capuchino"
        ],
        correctAnswerIndex: 0,
        info:
            "El Mono Araña Cafecíneo (Ateles hybridus) vive en los bosques de la región Caribe de Colombia.",
        difficulty: Difficulty.easy,
        imagePath: "assets/animals/mono_arana_cafecineo.jpg",
        nombreCientifico: "Ateles hybridus"),
    Question(
        question:
            "¿Qué especie de tortuga marina habita en el Caribe colombiano?",
        options: [
          "Tortuga Baula",
          "Tortuga Verde",
          "Tortuga Carey",
          "Tortuga Boba"
        ],
        correctAnswerIndex: 2,
        info:
            "La Tortuga Carey (Eretmochelys imbricata) habita en el Caribe colombiano y está en peligro crítico.",
        difficulty: Difficulty.easy,
        imagePath: "assets/animals/tortuga_carey.jpg",
        nombreCientifico: "Eretmochelys imbricata"),
    Question(
      question: "¿Qué ave de hermoso plumaje azul se encuentra en la Amazonía?",
      options: [
        "Guacamaya Roja",
        "Guacamaya Verde",
        "Papagayo",
        "Guacamaya Azul",
      ],
      correctAnswerIndex: 3,
      info:
          "La Guacamaya Azul (Anodorhynchus hyacinthinus) es nativa de la Amazonía y se encuentra en peligro por el comercio ilegal.",
      difficulty: Difficulty.easy,
      imagePath: "assets/animals/guacamaya_azul.jpg",
      nombreCientifico: "Anodorhynchus hyacinthinus",
    ),
    Question(
      question:
          "¿Cuál es la característica distintiva de la Rana de San Andrés?",
      options: [
        "Color brillante",
        "Pequeño tamaño",
        "Piel con espinas",
        "Canto melodioso"
      ],
      correctAnswerIndex: 2,
      info:
          "La Rana de San Andrés (Eleutherodactylus limbatus) tiene una piel distintiva con pequeñas espinas.",
      difficulty: Difficulty.easy,
      imagePath: "assets/animals/rana_san_andres.jpg",
      nombreCientifico: "Eleutherodactylus limbatus",
    ),
    Question(
      question: "¿Cuál es el principal hábitat del Cacique de la Guajira?",
      options: ["Manglares", "Bosques secos", "Bosques húmedos", "Sabana"],
      correctAnswerIndex: 1,
      info:
          "El Cacique de la Guajira (Cacicus cajaneus) se encuentra principalmente en los bosques secos del Caribe colombiano.",
      difficulty: Difficulty.easy,
      imagePath: "assets/animals/cacique_guajira.jpg",
      nombreCientifico: "Cacicus cajaneus",
    ),
    Question(
      question: "¿Qué papel ecológico cumple la Danta o Tapir en los bosques?",
      options: [
        "Dispersor de semillas",
        "Depredador",
        "Polinizador",
        "Productor primario"
      ],
      correctAnswerIndex: 0,
      info:
          "La Danta o Tapir (Tapirus terrestris) es esencial en su rol de dispersor de semillas en los ecosistemas donde habita.",
      difficulty: Difficulty.easy,
      imagePath: "assets/animals/danta.jpg",
      nombreCientifico: "Tapirus terrestris",
    ),

    // INTERMEDIO
    Question(
        question:
            "¿Qué especie extinta era un roedor gigante ancestro del actual chigüiro?",
        options: [
          "Capibara",
          "Chigüiro Gigante",
          "Rata de Ciénaga",
          "Rata Gigante"
        ],
        correctAnswerIndex: 1,
        info:
            "El Chigüiro Gigante (Neochoerus pinckneyi) habitaba en los humedales de Sudamérica.",
        difficulty: Difficulty.medium,
        imagePath: "assets/animals/chiguiro_gigante.webp",
        nombreCientifico: "Neochoerus pinckneyi"),
    Question(
        question:
            "¿Qué mamífero habita en los bosques nublados de la región andina?",
        options: ["Oso Pardo", "Oso Polar", "Oso de Anteojos", "Panda"],
        correctAnswerIndex: 2,
        info:
            "El Oso de Anteojos (Tremarctos ornatus) es el único oso que vive en Sudamérica, principalmente en la región andina.",
        difficulty: Difficulty.medium,
        imagePath: "assets/animals/oso_anteojos.jpg",
        nombreCientifico: "Tremarctos ornatus"),
    Question(
        question:
            "¿Qué delfín de agua dulce es conocido por su color rosado y habita en el Amazonas?",
        options: [
          "Delfín Rosado",
          "Delfín del Caribe",
          "Delfín del Ganges",
          "Delfín Gris"
        ],
        correctAnswerIndex: 0,
        info:
            "El Delfín Rosado (Inia geoffrensis) es un mamífero acuático de agua dulce que habita en el Amazonas.",
        difficulty: Difficulty.medium,
        imagePath: "assets/animals/delfin_rosado.jpg",
        nombreCientifico: "Inia geoffrensis"),
    Question(
      question:
          "¿Qué ave, ya extinta en el Caribe, era conocida por su tamaño y color?",
      options: [
        "Foca Leopardo",
        "Lobo Marino",
        "Foca Fraile del Caribe",
        "Foca común"
      ],
      correctAnswerIndex: 2,
      info:
          "La Foca Fraile del Caribe (Monachus tropicalis) vivió en las aguas del Caribe, pero fue llevada a la extinción debido a la caza.",
      difficulty: Difficulty.medium,
      imagePath: "assets/animals/foca_caribe.jpg",
      nombreCientifico: "Monachus tropicalis",
    ),
    Question(
      question: "¿Cuál es el nombre común del Venado Cola Blanca?",
      options: [
        "Venado de cola larga",
        "Ciervo común",
        "Venado cola blanca",
        "Antílope americano"
      ],
      correctAnswerIndex: 2,
      info:
          "El Venado Cola Blanca (Odocoileus virginianus) es conocido por su cola blanca y es una especie común en Colombia.",
      difficulty: Difficulty.medium,
      imagePath: "assets/animals/venado_cola_blanca.jpg",
      nombreCientifico: "Odocoileus virginianus",
    ),

    Question(
      question: "¿Qué tipo de hábitat prefiere el Murciélago de San Andrés?",
      options: ["Bosques tropicales", "Cuevas", "Manglares", "Bosques secos"],
      correctAnswerIndex: 1,
      info:
          "El Murciélago de San Andrés (Phyllostomus spp.) habita en cuevas y zonas de vegetación densa en la isla.",
      difficulty: Difficulty.medium,
      imagePath: "assets/animals/murcielago_san_andres.webp",
      nombreCientifico: "Phyllostomus spp.",
    ),
    Question(
      question: "¿Qué característica distingue a la Rana de Cristal?",
      options: [
        "Piel traslúcida",
        "Color verde oscuro",
        "Patrón de rayas",
        "Pequeño tamaño"
      ],
      correctAnswerIndex: 0,
      info:
          "La Rana de Cristal (Cochranella spinosa) es conocida por su piel traslúcida, permitiendo ver sus órganos internos.",
      difficulty: Difficulty.medium,
      imagePath: "assets/animals/rana_cristal.jpg",
      nombreCientifico: "Cochranella spinosa",
    ),
    Question(
      question: "¿Cuál es el principal alimento del Sábalo en su hábitat?",
      options: [
        "Plantas acuáticas",
        "Peces pequeños",
        "Insectos",
        "Crustáceos"
      ],
      correctAnswerIndex: 1,
      info:
          "El Sábalo, también conocido como Sabalete o Tarpon (Megalops atlanticus), se alimenta principalmente de peces pequeños en su hábitat.",
      difficulty: Difficulty.medium,
      imagePath: "assets/animals/sabalo.jpg",
      nombreCientifico: "Megalops atlanticus",
    ),
    Question(
      question: "¿Dónde habita la Serpiente de San Andrés?",
      options: [
        "Bosques secos",
        "Bosques húmedos",
        "Islas de Colombia",
        "Selvas amazónicas"
      ],
      correctAnswerIndex: 2,
      info:
          "La Serpiente de San Andrés (Coniophanes andresensis) es endémica de la isla de San Andrés en Colombia.",
      difficulty: Difficulty.medium,
      imagePath: "assets/animals/serpiente_san_andres.jpg",
      nombreCientifico: "Coniophanes andresensis",
    ),
    Question(
      question: "¿Dónde habita principalmente el Camaleón de Cundinamarca?",
      options: ["Amazonía", "Región Andina", "Caribe", "Orinoquía"],
      correctAnswerIndex: 1,
      info:
          "El Camaleón de Cundinamarca (Anolis inderenae) es endémico de la región Andina de Colombia.",
      difficulty: Difficulty.medium,
      imagePath: "assets/animals/camaleon_cundinamarca.jpg",
      nombreCientifico: "Anolis inderenae",
    ),

    Question(
      question: "¿Cuál es la dieta principal del Mono Araña de Manos Negras?",
      options: ["Insectos", "Frutas", "Hojas", "Pequeños mamíferos"],
      correctAnswerIndex: 1,
      info:
          "El Mono Araña de Manos Negras (Ateles chamek) se alimenta principalmente de frutas en su hábitat natural.",
      difficulty: Difficulty.medium,
      imagePath: "assets/animals/mono_arana.webp",
      nombreCientifico: "Ateles chamek",
    ),
    Question(
      question:
          "¿Cuál es el hábitat del Lagarto de escamas grandes del Hermano Daniel?",
      options: ["Bosques húmedos", "Manglares", "Desiertos", "Praderas"],
      correctAnswerIndex: 0,
      info:
          "El Lagarto de escamas grandes del Hermano Daniel (Ptychoglossus danieli) habita en los bosques húmedos de Colombia.",
      difficulty: Difficulty.medium,
      imagePath: "assets/animals/lagarto_hermano_daniel.jpg",
      nombreCientifico: "Ptychoglossus danieli",
    ),
    Question(
      question: "¿Qué comportamiento caracteriza al Mono Aullador?",
      options: [
        "Canto fuerte",
        "Saltos acrobáticos",
        "Solitarismo",
        "Capacidad de nado"
      ],
      correctAnswerIndex: 0,
      info:
          "El Mono Aullador (Alouatta palliata) es conocido por su fuerte canto, que se escucha a gran distancia.",
      difficulty: Difficulty.medium,
      imagePath: "assets/animals/mono_aullador.jpg",
      nombreCientifico: "Alouatta palliata",
    ),
    Question(
      question: "¿Cuál es el hábitat de la Rana de la Sierra?",
      options: ["Bosques húmedos", "Desiertos", "Manglares", "Sabana"],
      correctAnswerIndex: 0,
      info:
          "La Rana de la Sierra (Hypsiboas tigrinus) habita en bosques húmedos de montaña en la región Andina.",
      difficulty: Difficulty.medium,
      imagePath: "assets/animals/rana_sierra.jpeg",
      nombreCientifico: "Hypsiboas tigrinus",
    ),

    // DIFICIL
    Question(
        question:
            "¿Qué felino prehistórico es famoso por sus largos colmillos?",
        options: [
          "Tigre Dientes de Sable",
          "Jaguar Gigante",
          "Gato Maracuyá",
          "León Americano"
        ],
        correctAnswerIndex: 0,
        info:
            "El Tigre Dientes de Sable (Smilodon fatalis) es un felino prehistórico famoso por sus largos colmillos.",
        difficulty: Difficulty.hard,
        imagePath: "assets/animals/tigre_dientes_sable.jpeg",
        nombreCientifico: "Smilodon fatalis"),
    Question(
        question: "¿Qué especie de pez tiene un hocico en forma de sierra?",
        options: ["Tiburón Martillo", "Pez Sierra", "Pez Espada", "Esturión"],
        correctAnswerIndex: 1,
        info:
            "El Pez Sierra (Pristis pristis) es conocido por su hocico en forma de sierra y habita en ríos y estuarios.",
        difficulty: Difficulty.hard,
        imagePath: "assets/animals/pez_sierra.jpg",
        nombreCientifico: "Pristis pristis"),
    Question(
      question:
          "¿Qué delfín de agua dulce es conocido por su extinción en Asia?",
      options: [
        "Delfín Rosado",
        "Delfín de Río",
        "Delfín del Indo"
            "Delfín del río Yangtsé",
      ],
      correctAnswerIndex: 3,
      info:
          "El Delfín del río Yangtsé (Lipotes vexillifer) se considera extinto debido a la intensa actividad humana en su hábitat.",
      difficulty: Difficulty.hard,
      imagePath: "assets/animals/delfin_yangtse.webp",
      nombreCientifico: "Lipotes vexillifer",
    ),
    Question(
      question:
          "¿Cuál es la mayor amenaza para la Tortuga Baula en el océano Atlántico?",
      options: [
        "Caza furtiva",
        "Destrucción de hábitat",
        "Contaminación",
        "Cambio climático"
      ],
      correctAnswerIndex: 1,
      info:
          "La Tortuga Baula (Dermochelys coriacea) está en peligro principalmente debido a la destrucción de su hábitat y la contaminación.",
      difficulty: Difficulty.hard,
      imagePath: "assets/animals/tortuga_baula.jpg",
      nombreCientifico: "Dermochelys coriacea",
    ),
    Question(
      question: "¿Dónde se encontraba mayormente el Guacamayo de Spix?",
      options: [
        "Amazonía",
        "Región del Orinoco",
        "Región Andina",
        "Bosques secos del noreste"
      ],
      correctAnswerIndex: 3,
      info:
          "El Guacamayo de Spix (Cyanopsitta spixii) habitaba principalmente en los bosques secos del noreste de Brasil y ahora está extinto en la naturaleza.",
      difficulty: Difficulty.hard,
      imagePath: "assets/animals/guacamayo_spix.jpg",
      nombreCientifico: "Cyanopsitta spixii",
    ),
    Question(
      question:
          "¿Cuál es la principal amenaza de la Tortuga de Río en Colombia?",
      options: [
        "Caza",
        "Contaminación del agua",
        "Destrucción del hábitat",
        "Cambio climático"
      ],
      correctAnswerIndex: 2,
      info:
          "La Tortuga de Río (Podocnemis expansa) enfrenta grandes amenazas debido a la destrucción de su hábitat.",
      difficulty: Difficulty.hard,
      imagePath: "assets/animals/tortuga_rio.jpg",
      nombreCientifico: "Podocnemis expansa",
    ),
    Question(
      question: "¿En qué región es endémica la Totumo Gambusia?",
      options: ["Amazonía", "Caribe", "Región Andina", "Pacífico"],
      correctAnswerIndex: 3,
      info:
          "La Totumo Gambusia (Gambusia lemaitrei) es endémica de la región del Pacífico colombiano.",
      difficulty: Difficulty.hard,
      imagePath: "assets/animals/totumo_gambusia.jpeg",
      nombreCientifico: "Gambusia lemaitrei",
    ),
    Question(
      question: "¿Cuál es el hábitat principal del Mero Guasa?",
      options: [
        "Arrecifes coralinos",
        "Manglares",
        "Ríos de agua dulce",
        "Mar abierto"
      ],
      correctAnswerIndex: 0,
      info:
          "El Mero Guasa o Goliath Grouper (Epinephelus itajara) se encuentra principalmente en arrecifes coralinos en el Caribe colombiano.",
      difficulty: Difficulty.hard,
      imagePath: "assets/animals/mero_guasa.jpg",
      nombreCientifico: "Epinephelus itajara",
    ),
    Question(
      question: "¿Cuál es el alimento principal del Paujil de pico azul?",
      options: ["Insectos", "Frutos", "Hojas", "Pequeños mamíferos"],
      correctAnswerIndex: 1,
      info:
          "El Paujil de pico azul (Crax alberti) se alimenta principalmente de frutos en la región del Magdalena Medio.",
      difficulty: Difficulty.hard,
      imagePath: "assets/animals/paujil_pico_azul.jpg",
      nombreCientifico: "Crax alberti",
    ),
    Question(
      question: "¿Qué tipo de hábitat prefiere la Culebra de Boshelli?",
      options: ["Bosques secos", "Bosques húmedos", "Manglares", "Praderas"],
      correctAnswerIndex: 1,
      info:
          "La Culebra de Boshelli (Dendrophidion boshelli) habita principalmente en bosques húmedos tropicales.",
      difficulty: Difficulty.hard,
      imagePath: "assets/animals/culebra_boshelli.jpg",
      nombreCientifico: "Dendrophidion boshelli",
    ),
    Question(
      question:
          "¿Cuál es la característica distintiva de la Serpiente del Caño del Dagua?",
      options: [
        "Color verde",
        "Escamas brillantes",
        "Patrón de rayas",
        "Piel rugosa"
      ],
      correctAnswerIndex: 2,
      info:
          "La Serpiente del Caño del Dagua (Synophis plectovertebralis) es reconocida por su distintivo patrón de rayas.",
      difficulty: Difficulty.hard,
      imagePath: "assets/animals/serpiente_dagua.png",
      nombreCientifico: "Synophis plectovertebralis",
    ),
    Question(
      question: "¿Qué amenaza enfrenta el Gato Maracuyá en Colombia?",
      options: [
        "Caza furtiva",
        "Destrucción del hábitat",
        "Competencia con otras especies",
        "Cambio climático"
      ],
      correctAnswerIndex: 1,
      info:
          "El Gato Maracuyá (Leopardus wiedii) enfrenta amenazas debido a la destrucción de su hábitat.",
      difficulty: Difficulty.hard,
      imagePath: "assets/animals/gato_maracuya.jpg",
      nombreCientifico: "Leopardus wiedii",
    ),
    Question(
      question: "¿Dónde habita la Danta de Montaña?",
      options: ["Bosques de montaña", "Praderas", "Manglares", "Desiertos"],
      correctAnswerIndex: 0,
      info:
          "La Danta de Montaña (Tapirus pinchaque) vive en los bosques de montaña de los Andes.",
      difficulty: Difficulty.hard,
      imagePath: "assets/animals/danta_montana.jpg",
      nombreCientifico: "Tapirus pinchaque",
    ),
    Question(
      question: "¿Qué amenaza enfrenta el Manatí en los ríos de Colombia?",
      options: [
        "Caza ilegal",
        "Contaminación del agua",
        "Pérdida de hábitat",
        "Todas las anteriores"
      ],
      correctAnswerIndex: 3,
      info:
          "El Manatí (Trichechus inunguis) enfrenta múltiples amenazas, incluyendo la caza, la contaminación y la pérdida de hábitat.",
      difficulty: Difficulty.hard,
      imagePath: "assets/animals/manati.jpg",
      nombreCientifico: "Trichechus inunguis",
    ),
  ];
}
