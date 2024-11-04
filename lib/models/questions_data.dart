import 'package:vestigios_salvajes/models/question.dart';

List<Question> getQuestions() {
  return [
    // Preguntas de dificultad fácil
    Question(
      question:
          "¿Cuál es el mamífero extinto en Colombia conocido por su gran tamaño?",
      options: [
        "Megatherium",
        "Oso de anteojos",
        "Tigre dientes de sable",
        "Puma"
      ],
      correctAnswerIndex: 0,
      info:
          "El Megatherium, o perezoso gigante, habitó en la región norte de Colombia y llegó a medir hasta 6 metros.",
      difficulty: Difficulty.easy,
      imagePath: "assets/images/animals/megatherium.png",
    ),
    Question(
      question:
          "¿Qué ave en peligro de extinción es símbolo nacional de Colombia?",
      options: [
        "Cóndor de los Andes",
        "Águila harpía",
        "Guacamaya verde",
        "Colibrí esmeralda"
      ],
      correctAnswerIndex: 0,
      info:
          "El Cóndor de los Andes es símbolo de libertad y fortaleza, y vive en las altas montañas andinas.",
      difficulty: Difficulty.easy,
      imagePath: "assets/images/animals/condor_andes.png",
    ),
    Question(
      question:
          "¿Qué especie de tortuga en peligro de extinción habita en el Caribe colombiano?",
      options: [
        "Tortuga Carey",
        "Tortuga Verde",
        "Tortuga Laúd",
        "Tortuga Boba"
      ],
      correctAnswerIndex: 0,
      info:
          "La Tortuga Carey habita en el Caribe colombiano y está en peligro crítico por la caza furtiva.",
      difficulty: Difficulty.easy,
      imagePath: "assets/images/animals/tortuga_carey.png",
    ),
    Question(
      question:
          "¿Cuál es la única especie de oso nativa de Sudamérica que habita en Colombia?",
      options: ["Oso de anteojos", "Oso polar", "Oso negro", "Panda gigante"],
      correctAnswerIndex: 0,
      info:
          "El Oso de anteojos vive en los Andes colombianos y está en peligro por la caza y la deforestación.",
      difficulty: Difficulty.easy,
      imagePath: "assets/images/animals/oso_anteojos.png",
    ),
    Question(
      question:
          "¿Qué animal en peligro de extinción es conocido como el 'delfín rosado'?",
      options: ["Manatí", "Delfín rosado", "Caimán del Orinoco", "Nutria"],
      correctAnswerIndex: 1,
      info:
          "El delfín rosado del Amazonas habita en los ríos colombianos y está amenazado por la contaminación.",
      difficulty: Difficulty.easy,
      imagePath: "assets/images/animals/delfin_rosado.png",
    ),
    Question(
      question:
          "¿Qué pez grande y emblemático de los ríos amazónicos está en peligro?",
      options: ["Piracucú", "Sardina", "Bagre", "Trucha arcoíris"],
      correctAnswerIndex: 0,
      info:
          "El piracucú, uno de los peces de agua dulce más grandes del mundo, está amenazado por la sobrepesca.",
      difficulty: Difficulty.easy,
      imagePath: "assets/images/animals/piracucu.png",
    ),
    Question(
      question:
          "¿Cuál es la causa principal de la desaparición de la rana arlequín en Colombia?",
      options: [
        "Deforestación",
        "Cambio climático",
        "Caza furtiva",
        "Contaminación"
      ],
      correctAnswerIndex: 0,
      info:
          "La rana arlequín, que vive en zonas húmedas, ha sido muy afectada por la deforestación.",
      difficulty: Difficulty.easy,
      imagePath: "assets/images/animals/rana_arlequin.png",
    ),
    Question(
      question:
          "¿Qué ave se considera extinta en Colombia debido a la pérdida de su hábitat en los Andes?",
      options: ["Pájaro Carpintero Real", "Águila arpía", "Cóndor", "Pato Poc"],
      correctAnswerIndex: 0,
      info:
          "El Pájaro Carpintero Real se extinguió debido a la deforestación masiva en su hábitat.",
      difficulty: Difficulty.easy,
      imagePath: "assets/images/animals/pajaro_carpintero.png",
    ),
    Question(
      question:
          "¿Qué especie marina en peligro habita en el Caribe colombiano?",
      options: [
        "Tortuga Carey",
        "Delfín común",
        "Ballena jorobada",
        "Tiburón martillo"
      ],
      correctAnswerIndex: 0,
      info:
          "La tortuga Carey está en peligro crítico debido a la caza ilegal en el Caribe.",
      difficulty: Difficulty.easy,
      imagePath: "assets/images/animals/tortuga_carey.png",
    ),
    Question(
      question:
          "¿Qué felino en peligro de extinción es el más grande de Colombia?",
      options: ["Jaguar", "Puma", "Tigrillo", "Ocelote"],
      correctAnswerIndex: 0,
      info:
          "El Jaguar es el felino más grande de América y está en peligro debido a la pérdida de su hábitat.",
      difficulty: Difficulty.easy,
      imagePath: "assets/images/animals/jaguar.png",
    ),
    // Continúa con 10 preguntas fáciles adicionales para este nivel
    // ...

    // Preguntas de dificultad media
    Question(
      question:
          "¿Cuál es el principal peligro para la supervivencia del Manatí del Amazonas?",
      options: [
        "Pesca ilegal",
        "Contaminación del agua",
        "Pérdida de hábitat",
        "Cambio climático"
      ],
      correctAnswerIndex: 1,
      info:
          "El manatí amazónico está amenazado por la contaminación de su hábitat en la Amazonía.",
      difficulty: Difficulty.medium,
      imagePath: "assets/images/animals/manati_amazonas.png",
    ),
    Question(
      question:
          "¿Cuál es el principal depredador de la rana venenosa dorada en su hábitat?",
      options: ["Serpientes", "Aves", "Mamíferos", "Otros anfibios"],
      correctAnswerIndex: 1,
      info:
          "En la selva tropical, las aves son los principales depredadores de la rana venenosa dorada.",
      difficulty: Difficulty.medium,
      imagePath: "assets/images/animals/rana_venenosa_dorada.png",
    ),
    Question(
      question:
          "¿Qué animal en peligro crítico se encuentra en la Sierra Nevada de Santa Marta?",
      options: ["Tigrillo", "Caimán aguja", "Tortuga laúd", "Mono araña"],
      correctAnswerIndex: 3,
      info:
          "El mono araña, amenazado por la pérdida de hábitat, habita en la Sierra Nevada de Santa Marta.",
      difficulty: Difficulty.medium,
      imagePath: "assets/images/animals/mono_arana.png",
    ),
    Question(
      question:
          "¿Qué especie de reptil gigante extinto habitó en Colombia hace millones de años?",
      options: [
        "Titanoboa",
        "Anaconda",
        "Caimán del Orinoco",
        "Serpiente marina"
      ],
      correctAnswerIndex: 0,
      info:
          "La Titanoboa, la serpiente más grande conocida, habitó en lo que hoy es La Guajira.",
      difficulty: Difficulty.medium,
      imagePath: "assets/images/animals/titanoboa.png",
    ),
    Question(
      question:
          "¿Qué causa ha contribuido más a la reducción del número de cóndores en Colombia?",
      options: [
        "Falta de alimento",
        "Caza furtiva",
        "Cambio climático",
        "Deforestación"
      ],
      correctAnswerIndex: 1,
      info:
          "La caza furtiva ha sido una de las principales causas de la disminución de cóndores.",
      difficulty: Difficulty.medium,
      imagePath: "assets/images/animals/condor_andes.png",
    ),
    // Continua con más preguntas de dificultad media (20 en total)

    // Preguntas de dificultad difícil
    Question(
      question:
          "¿Qué factores contribuyeron a la extinción del Megatherium en Colombia?",
      options: [
        "Cambio climático y caza humana",
        "Enfermedades",
        "Pérdida de hábitat",
        "Competencia con otras especies"
      ],
      correctAnswerIndex: 0,
      info:
          "El cambio climático y la caza contribuyeron a la extinción de este perezoso gigante.",
      difficulty: Difficulty.hard,
      imagePath: "assets/images/animals/megatherium_extinto.png",
    ),
    Question(
      question:
          "¿Qué especie de rana venenosa está restringida solo a Colombia y Ecuador?",
      options: [
        "Rana dorada venenosa",
        "Rana arlequín",
        "Rana verde esmeralda",
        "Rana leopardo"
      ],
      correctAnswerIndex: 0,
      info:
          "La rana dorada venenosa solo se encuentra en Colombia y Ecuador, y su veneno es uno de los más potentes.",
      difficulty: Difficulty.hard,
      imagePath: "assets/images/animals/rana_dorada.png",
    ),
    Question(
      question:
          "¿Cuál de las siguientes especies se considera extinta en los ríos de Colombia?",
      options: ["Delfín rosado", "Bagre rayado", "Caimán llanero", "Pirarucú"],
      correctAnswerIndex: 3,
      info:
          "El pirarucú, uno de los peces de agua dulce más grandes, está extinto localmente en algunos ríos.",
      difficulty: Difficulty.hard,
      imagePath: "assets/images/animals/pirarucu_extinto.png",
    ),
    Question(
      question:
          "¿Qué región de Colombia es el último refugio del oso de anteojos?",
      options: [
        "Los Andes",
        "Amazonas",
        "Llanos Orientales",
        "Sierra Nevada de Santa Marta"
      ],
      correctAnswerIndex: 0,
      info:
          "El oso de anteojos se encuentra principalmente en los Andes colombianos.",
      difficulty: Difficulty.hard,
      imagePath: "assets/images/animals/oso_anteojos.png",
    ),
    Question(
      question:
          "¿Qué relación tiene la rana dorada con los pueblos indígenas de Colombia?",
      options: [
        "Usada para veneno de dardos",
        "Parte de rituales",
        "Animal de compañía",
        "Símbolo de fertilidad"
      ],
      correctAnswerIndex: 0,
      info:
          "Los pueblos indígenas usaban el veneno de la rana dorada para envenenar sus dardos.",
      difficulty: Difficulty.hard,
      imagePath: "assets/images/animals/rana_dorada.png",
    ),
    Question(
      question:
          "¿Cuál fue la razón principal de la extinción del Tigre Dientes de Sable en América?",
      options: [
        "Cambios climáticos",
        "Caza humana",
        "Competencia con otras especies",
        "Enfermedades"
      ],
      correctAnswerIndex: 1,
      info:
          "La caza por parte de los humanos y los cambios climáticos contribuyeron a la extinción del Tigre Dientes de Sable.",
      difficulty: Difficulty.hard,
      imagePath: "assets/images/animals/tigre_dientes_de_sable.png",
    ),
    Question(
      question:
          "¿Qué ave extinta de Colombia era reconocida por su llamativo plumaje amarillo y negro?",
      options: [
        "Pájaro Carpintero Real",
        "Guacamaya Verde",
        "Tucán Amarillo",
        "Ave del Paraíso"
      ],
      correctAnswerIndex: 0,
      info:
          "El Pájaro Carpintero Real, conocido por sus plumas amarillas y negras, se extinguió debido a la pérdida de hábitat.",
      difficulty: Difficulty.hard,
      imagePath: "assets/images/animals/pajaro_carpintero_real.png",
    ),
    Question(
      question:
          "¿Cuál es una de las amenazas más serias para la supervivencia del Caimán del Orinoco?",
      options: [
        "Contaminación de aguas",
        "Caza furtiva",
        "Competencia por alimento",
        "Cambio climático"
      ],
      correctAnswerIndex: 1,
      info:
          "La caza furtiva ha reducido drásticamente la población del Caimán del Orinoco en los ríos colombianos.",
      difficulty: Difficulty.hard,
      imagePath: "assets/images/animals/caiman_orinoco.png",
    ),
    Question(
      question:
          "¿Cuál es la única especie de murciélago que se alimenta de frutas en Colombia?",
      options: [
        "Murciélago frugívoro",
        "Murciélago insectívoro",
        "Vampiro común",
        "Murciélago pescador"
      ],
      correctAnswerIndex: 0,
      info:
          "El murciélago frugívoro es una especie en peligro de extinción debido a la deforestación.",
      difficulty: Difficulty.hard,
      imagePath: "assets/images/animals/murcielago_frugivoro.png",
    ),
    Question(
      question:
          "¿Cuál fue la principal causa de la desaparición del Megatherium?",
      options: [
        "Cambios climáticos",
        "Caza por humanos",
        "Competencia por alimento",
        "Enfermedades"
      ],
      correctAnswerIndex: 1,
      info:
          "El Megatherium desapareció principalmente debido a la caza y los cambios en su entorno.",
      difficulty: Difficulty.hard,
      imagePath: "assets/images/animals/megatherium_extinto.png",
    ),
    Question(
      question:
          "¿Qué factor llevó a la extinción de muchas especies de tortugas en el Caribe?",
      options: [
        "Contaminación",
        "Caza furtiva",
        "Competencia con especies invasoras",
        "Turismo"
      ],
      correctAnswerIndex: 1,
      info:
          "La caza furtiva ha sido una de las principales amenazas para las tortugas en el Caribe.",
      difficulty: Difficulty.hard,
      imagePath: "assets/images/animals/tortuga_extinta_caribe.png",
    ),
    Question(
      question:
          "¿Cuál es el nombre científico del oso de anteojos, una especie en peligro en Colombia?",
      options: [
        "Tremarctos ornatus",
        "Panthera onca",
        "Puma concolor",
        "Ateles hybridus"
      ],
      correctAnswerIndex: 0,
      info:
          "El oso de anteojos, o Tremarctos ornatus, habita en la región andina de Colombia.",
      difficulty: Difficulty.hard,
      imagePath: "assets/images/animals/oso_anteojos.png",
    ),
    Question(
      question:
          "¿Qué pez en peligro de extinción se encuentra en los ríos colombianos y es crucial para la pesca?",
      options: ["Bagre rayado", "Piracucú", "Trucha arcoíris", "Carpa"],
      correctAnswerIndex: 1,
      info:
          "El piracucú, uno de los peces de agua dulce más grandes, está en peligro debido a la sobrepesca.",
      difficulty: Difficulty.hard,
      imagePath: "assets/images/animals/piracucu.png",
    ),
    Question(
      question:
          "¿Qué rana venenosa de Colombia ha sido utilizada en investigaciones médicas?",
      options: [
        "Rana dorada",
        "Rana arlequín",
        "Rana venenosa azul",
        "Rana dardo rojo"
      ],
      correctAnswerIndex: 0,
      info:
          "La rana dorada de Colombia es de interés médico debido a su potente veneno.",
      difficulty: Difficulty.hard,
      imagePath: "assets/images/animals/rana_dorada.png",
    ),
    Question(
      question:
          "¿En qué región de Colombia se encuentra el hábitat del Mono Aullador Rojo?",
      options: ["Amazonas", "Chocó", "Sierra Nevada", "Orinoquía"],
      correctAnswerIndex: 0,
      info:
          "El Mono Aullador Rojo vive principalmente en la selva amazónica y está en peligro por la deforestación.",
      difficulty: Difficulty.hard,
      imagePath: "assets/images/animals/mono_aullador.png",
    ),
    Question(
      question:
          "¿Cuál es la causa principal de la amenaza al Águila Harpía en Colombia?",
      options: [
        "Caza furtiva",
        "Deforestación",
        "Contaminación",
        "Competencia por alimento"
      ],
      correctAnswerIndex: 1,
      info:
          "La deforestación en los bosques tropicales está disminuyendo el hábitat del Águila Harpía.",
      difficulty: Difficulty.hard,
      imagePath: "assets/images/animals/aguila_harpia.png",
    ),
    Question(
      question: "¿Cuál es el hábitat principal del delfín rosado del Amazonas?",
      options: [
        "Ríos y lagunas",
        "Océano Pacífico",
        "Llanos Orientales",
        "Selva de la Guajira"
      ],
      correctAnswerIndex: 0,
      info:
          "El delfín rosado habita en ríos y lagunas del Amazonas y Orinoquía.",
      difficulty: Difficulty.hard,
      imagePath: "assets/images/animals/delfin_rosado.png",
    ),
    Question(
      question:
          "¿Qué reptil gigante extinto fue encontrado en la región de La Guajira?",
      options: [
        "Titanoboa",
        "Anaconda",
        "Caimán del Orinoco",
        "Serpiente marina"
      ],
      correctAnswerIndex: 0,
      info:
          "La Titanoboa fue una serpiente gigante que habitó en la región de La Guajira hace millones de años.",
      difficulty: Difficulty.hard,
      imagePath: "assets/images/animals/titanoboa.png",
    ),
    Question(
      question:
          "¿Cuál es el ave más amenazada por la deforestación en la Amazonía colombiana?",
      options: [
        "Guacamaya verde",
        "Águila harpía",
        "Colibrí esmeralda",
        "Pájaro carpintero real"
      ],
      correctAnswerIndex: 1,
      info:
          "El Águila harpía está en grave peligro debido a la deforestación en la Amazonía.",
      difficulty: Difficulty.hard,
      imagePath: "assets/images/animals/aguila_harpia.png",
    ),
    Question(
      question:
          "¿Qué especie de tortuga marina en Colombia está en mayor riesgo de extinción?",
      options: [
        "Tortuga Laúd",
        "Tortuga Verde",
        "Tortuga Boba",
        "Tortuga Carey"
      ],
      correctAnswerIndex: 3,
      info:
          "La Tortuga Carey está críticamente amenazada debido a la caza y pérdida de hábitat.",
      difficulty: Difficulty.hard,
      imagePath: "assets/images/animals/tortuga_carey.png",
    ),
    Question(
      question:
          "¿Qué especie de primate colombiano está en peligro crítico de extinción?",
      options: [
        "Mono araña de cabeza negra",
        "Mono titi",
        "Mono aullador",
        "Mono lanudo"
      ],
      correctAnswerIndex: 0,
      info:
          "El Mono araña de cabeza negra es una especie en peligro crítico por la deforestación y caza.",
      difficulty: Difficulty.hard,
      imagePath: "assets/images/animals/mono_arana_negra.png",
    ),
    Question(
      question:
          "¿Cuál fue una causa importante de la extinción de la Guacamaya Azul?",
      options: [
        "Caza furtiva",
        "Comercio ilegal de mascotas",
        "Deforestación",
        "Cambio climático"
      ],
      correctAnswerIndex: 2,
      info:
          "La Guacamaya Azul fue cazada y comercializada como mascota, lo que contribuyó a su extinción.",
      difficulty: Difficulty.hard,
      imagePath: "assets/images/guacamaya_azul.png",
    ),
    Question(
      question: "¿Cuál es una característica única de la rana dorada venenosa?",
      options: [
        "Su veneno mortal",
        "Habitat en altas montañas",
        "Comunicación por ultrasonidos",
        "Cambio de color"
      ],
      correctAnswerIndex: 0,
      info:
          "La rana dorada venenosa es extremadamente tóxica y vive en bosques tropicales de Colombia.",
      difficulty: Difficulty.hard,
      imagePath: "assets/images/animals/rana_dorada.png",
    ),
    Question(
      question:
          "¿Qué especie de loro, endémica de Colombia, está en peligro crítico?",
      options: [
        "Loro orejiamarillo",
        "Loro frente roja",
        "Loro azul",
        "Loro gris"
      ],
      correctAnswerIndex: 0,
      info:
          "El loro orejiamarillo es una especie en peligro crítico que habita en los Andes colombianos.",
      difficulty: Difficulty.hard,
      imagePath: "assets/images/animals/loro_orejiamarillo.png",
    ),
  ];
}
