import 'dart:typed_data';
import 'dart:math' as math;
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart';
import 'package:my_puzzle/src/domain/models/puzzle_image.dart';
import 'package:my_puzzle/src/domain/repositories/images_repository.dart';

const puzzleOptions = <PuzzleImage>[
  PuzzleImage(
    name: 'Numeric',
    info:
        '¡Ahora ya sabes como funciona, aumenta el reto y continúa con los animales!',
    scientificName: 'Any',
    assetPath: 'assets/images/numeric-puzzle.png',
    soundPath: '',
  ),
  PuzzleImage(
    name: 'Sapo Dorado',
    info:
        "El Sapo Dorado, de nombre científico Incilius periglenes, es conocido por su color dorado. Se extinguió debido al cambio climático y pérdida de hábitat.",
    scientificName: 'Incilius periglenes',
    assetPath: 'assets/animals/sapo_dorado.jpg',
    soundPath: 'assets/sounds/lion.mp3',
  ),
  PuzzleImage(
    name: 'Pato Serrucho',
    info:
        'El Pato Serrucho (Mergus octosetaceus) vivía en los ríos de la Amazonía. Desapareció por la destrucción de su hábitat.',
    scientificName: 'Mergus octosetaceus',
    assetPath: 'assets/animals/pato_serrucho.jpeg',
    soundPath: 'assets/sounds/cat.mp3',
  ),
  PuzzleImage(
    name: 'Tinamú Andino',
    info:
        'El Tinamú Andino (Nothoprocta curvirostris) es un ave que habita en las zonas montañosas de los Andes.',
    scientificName: 'Nothoprocta curvirostris',
    assetPath: 'assets/animals/tinamu_andino.jpg',
    soundPath: 'assets/sounds/dog.mp3',
  ),
  PuzzleImage(
    name: 'Nutria Gigante',
    info:
        'La Nutria Gigante (Pteronura brasiliensis) es un mamífero acuático que habita en ríos de la Amazonía y el Orinoco.',
    scientificName: 'Pteronura brasiliensis',
    assetPath: 'assets/animals/nutria_gigante.jpg',
    soundPath: 'assets/sounds/fox.mp3',
  ),
  PuzzleImage(
    name: 'Jaguar',
    info:
        'El Pecarí de Collar (Pecari tajacu) es presa del jaguar en su hábitat natural.',
    scientificName: 'Pecari tajacu',
    assetPath: 'assets/animals/pecari_de_collar.jpeg',
    soundPath: 'assets/sounds/koala.mp3',
  ),
  PuzzleImage(
    name: 'Mono Araña Cafecíneo',
    info:
        'El Mono Araña Cafecíneo (Ateles hybridus) vive en los bosques de la región Caribe de Colombia.',
    scientificName: 'Ateles hybridus',
    assetPath: 'assets/animals/mono_arana_cafecineo.jpg',
    soundPath: 'assets/sounds/monkey.mp3',
  ),
  PuzzleImage(
    name: 'Tortuga Carey',
    info:
        'La Tortuga Carey (Eretmochelys imbricata) habita en el Caribe colombiano y está en peligro crítico.',
    scientificName: 'Eretmochelys imbricata',
    assetPath: 'assets/animals/tortuga_carey.jpg',
    soundPath: 'assets/sounds/mouse.mp3',
  ),
  PuzzleImage(
    name: 'Guacamaya Azul',
    info:
        'La Guacamaya Azul (Anodorhynchus hyacinthinus) es nativa de la Amazonía y se encuentra en peligro por el comercio ilegal.',
    scientificName: 'Anodorhynchus hyacinthinus',
    assetPath: 'assets/animals/guacamaya_azul.jpg',
    soundPath: 'assets/sounds/panda.mp3',
  ),
  PuzzleImage(
    name: 'Rana de San Andrés',
    info:
        'La Rana de San Andrés (Eleutherodactylus limbatus) tiene una piel distintiva con pequeñas espinas.',
    scientificName: 'Eleutherodactylus limbatus',
    assetPath: 'assets/animals/rana_san_andres.jpg',
    soundPath: 'assets/sounds/penguin.mp3',
  ),
  PuzzleImage(
    name: 'El Cacique de la Guajira',
    info:
        'El Cacique de la Guajira (Cacicus cajaneus) se encuentra principalmente en los bosques secos del Caribe colombiano.',
    scientificName: 'Cacicus cajaneus',
    assetPath: 'assets/animals/cacique_guajira.jpg',
    soundPath: 'assets/sounds/tiger.mp3',
  ),
  PuzzleImage(
    name: 'Danta',
    info:
        'La Danta o Tapir (Tapirus terrestris) es esencial en su rol de dispersor de semillas en los ecosistemas donde habita.',
    scientificName: 'Tapirus terrestris',
    assetPath: "assets/animals/danta.jpg",
    soundPath: 'assets/sounds/tiger.mp3',
  ),
  PuzzleImage(
    name: 'Chigüiro Gigante',
    info:
        'El Chigüiro Gigante (Neochoerus pinckneyi) habitaba en los humedales de Sudamérica.',
    scientificName: 'Neochoerus pinckneyi',
    assetPath: "assets/animals/chiguiro_gigante.webp",
    soundPath: 'assets/sounds/tiger.mp3',
  ),
  PuzzleImage(
    name: 'Oso de Anteojos',
    info:
        'El Oso de Anteojos (Tremarctos ornatus) es el único oso que vive en Sudamérica, principalmente en la región andina.',
    scientificName: 'Tremarctos ornatus',
    assetPath: "assets/animals/oso_anteojos.jpg",
    soundPath: 'assets/sounds/tiger.mp3',
  ),
  PuzzleImage(
    name: 'Delfín Rosado',
    info:
        'El Delfín Rosado (Inia geoffrensis) es un mamífero acuático de agua dulce que habita en el Amazonas.',
    scientificName: 'Inia geoffrensis',
    assetPath: "assets/animals/delfin_rosado.jpg",
    soundPath: 'assets/sounds/tiger.mp3',
  ),
  PuzzleImage(
    name: 'Foca Fraile del Caribe',
    info:
        "La Foca Fraile del Caribe (Monachus tropicalis) vivió en las aguas del Caribe, pero fue llevada a la extinción debido a la caza.",
    scientificName: 'Monachus tropicalis',
    assetPath: "assets/animals/foca_caribe.jpg",
    soundPath: 'assets/sounds/tiger.mp3',
  ),
  PuzzleImage(
    name: 'Venado cola blanca',
    info:
        'El Venado Cola Blanca (Odocoileus virginianus) es conocido por su cola blanca y es una especie común en Colombia.',
    scientificName: 'Odocoileus virginianus',
    assetPath: "assets/animals/venado_cola_blanca.jpg",
    soundPath: 'assets/sounds/tiger.mp3',
  ),
  PuzzleImage(
    name: 'Murciélago de San Andrés',
    info:
        'El Murciélago de San Andrés (Phyllostomus spp.) habita en cuevas y zonas de vegetación densa en la isla.',
    scientificName: 'Phyllostomus spp.',
    assetPath: "assets/animals/murcielago_san_andres.webp",
    soundPath: 'assets/sounds/tiger.mp3',
  ),
  PuzzleImage(
    name: 'Rana de Cristal',
    info:
        'La Rana de Cristal (Cochranella spinosa) es conocida por su piel traslúcida, permitiendo ver sus órganos internos.',
    scientificName: 'Cochranella spinosa',
    assetPath: "assets/animals/rana_cristal.jpg",
    soundPath: 'assets/sounds/tiger.mp3',
  ),
  PuzzleImage(
    name: 'Sábalo',
    info:
        'El Sábalo, también conocido como Sabalete o Tarpon (Megalops atlanticus), se alimenta principalmente de peces pequeños en su hábitat.',
    scientificName: 'Megalops atlanticus',
    assetPath: "assets/animals/sabalo.webp",
    soundPath: 'assets/sounds/tiger.mp3',
  ),
  PuzzleImage(
    name: 'Serpiente de San Andrés',
    info:
        'La Serpiente de San Andrés (Coniophanes andresensis) es endémica de la isla de San Andrés en Colombia.',
    scientificName: 'Coniophanes andresensis',
    assetPath: "assets/animals/serpiente_san_andres.jpg",
    soundPath: 'assets/sounds/tiger.mp3',
  ),
  PuzzleImage(
    name: 'Camaleón de Cundinamarca',
    info:
        'El Camaleón de Cundinamarca (Anolis inderenae) es endémico de la región Andina de Colombia.',
    scientificName: 'Anolis inderenae',
    assetPath: "assets/animals/camaleon_cundinamarca.jpg",
    soundPath: 'assets/sounds/tiger.mp3',
  ),
  PuzzleImage(
    name: 'Mono Araña de Manos Negras',
    info:
        'El Mono Araña de Manos Negras (Ateles chamek) se alimenta principalmente de frutas en su hábitat natural.',
    scientificName: 'Ateles chamek',
    assetPath: "assets/animals/mono_arana.webp",
    soundPath: '',
  ),
  PuzzleImage(
    name: 'Lagarto de escamas grandes del Hermano Daniel',
    info:
        'El Lagarto de escamas grandes del Hermano Daniel (Ptychoglossus danieli) habita en los bosques húmedos de Colombia.',
    scientificName: 'Ptychoglossus danieli',
    assetPath: "assets/animals/lagarto_hermano_daniel.jpg",
    soundPath: '',
  ),
  PuzzleImage(
    name: 'Mono Aullador',
    info:
        'El Mono Aullador (Alouatta palliata) es conocido por su fuerte canto, que se escucha a gran distancia.',
    scientificName: 'Alouatta palliata',
    assetPath: "assets/animals/mono_aullador.jpg",
    soundPath: '',
  ),
  PuzzleImage(
    name: 'Rana de la Sierra',
    info:
        'La Rana de la Sierra (Hypsiboas tigrinus) habita en bosques húmedos de montaña en la región Andina.',
    scientificName: 'Hypsiboas tigrinus',
    assetPath: "assets/animals/rana_sierra.jpeg",
    soundPath: '',
  ),
  PuzzleImage(
    name: 'Tigre Dientes de Sable',
    info:
        'El Tigre Dientes de Sable (Smilodon fatalis) es un felino prehistórico famoso por sus largos colmillos.',
    scientificName: 'Smilodon fatalis',
    assetPath: "assets/animals/tigre_dientes_sable.jpeg",
    soundPath: '',
  ),
  PuzzleImage(
    name: 'Pez Sierra',
    info:
        'El Pez Sierra (Pristis pristis) es conocido por su hocico en forma de sierra y habita en ríos y estuarios.',
    scientificName: 'Pristis pristis',
    assetPath: "assets/animals/pez_sierra.jpg",
    soundPath: '',
  ),
  PuzzleImage(
    name: 'Delfín del río Yangtsé',
    info:
        'El Delfín del río Yangtsé (Lipotes vexillifer) se considera extinto debido a la intensa actividad humana en su hábitat.',
    scientificName: 'Lipotes vexillifer',
    assetPath: "assets/animals/delfin_yangtse.webp",
    soundPath: '',
  ),
  PuzzleImage(
    name: 'Tortuga Baula',
    info:
        'La Tortuga Baula (Dermochelys coriacea) está en peligro principalmente debido a la destrucción de su hábitat y la contaminación.',
    scientificName: 'Dermochelys coriacea',
    assetPath: "assets/animals/tortuga_baula.jpg",
    soundPath: '',
  ),
  PuzzleImage(
    name: 'Guacamayo de Spix',
    info:
        'El Guacamayo de Spix (Cyanopsitta spixii) habitaba principalmente en los bosques secos del noreste de Brasil y ahora está extinto en la naturaleza.',
    scientificName: 'Cyanopsitta spixii',
    assetPath: "assets/animals/guacamayo_spix.jpg",
    soundPath: '',
  ),
  PuzzleImage(
    name: 'Tortuga de Río',
    info:
        'La Tortuga de Río (Podocnemis expansa) enfrenta grandes amenazas debido a la destrucción de su hábitat.',
    scientificName: 'Podocnemis expansa',
    assetPath: "assets/animals/tortuga_rio.jpg",
    soundPath: '',
  ),
  PuzzleImage(
    name: 'Totumo Gambusia',
    info:
        'La Totumo Gambusia (Gambusia lemaitrei) es endémica de la región del Pacífico colombiano.',
    scientificName: 'Gambusia lemaitrei',
    assetPath: "assets/animals/totumo_gambusia.jpeg",
    soundPath: '',
  ),
  PuzzleImage(
    name: 'Mero Guasa',
    info:
        'El Mero Guasa o Goliath Grouper (Epinephelus itajara) se encuentra principalmente en arrecifes coralinos en el Caribe colombiano.',
    scientificName: 'Epinephelus itajara',
    assetPath: "assets/animals/mero_guasa.jpg",
    soundPath: '',
  ),
  PuzzleImage(
    name: 'Paujil de pico azul',
    info:
        'El Paujil de pico azul (Crax alberti) se alimenta principalmente de frutos en la región del Magdalena Medio.',
    scientificName: 'Crax alberti',
    assetPath: "assets/animals/paujil_pico_azul.jpg",
    soundPath: '',
  ),
  PuzzleImage(
    name: 'Culebra de Boshelli',
    info:
        'La Culebra de Boshelli (Dendrophidion boshelli) habita principalmente en bosques húmedos tropicales.',
    scientificName: 'Dendrophidion boshelli',
    assetPath: "assets/animals/culebra_boshelli.jpg",
    soundPath: '',
  ),
  PuzzleImage(
    name: 'Serpiente del Caño del Dagua',
    info:
        'La Serpiente del Caño del Dagua (Synophis plectovertebralis) es reconocida por su distintivo patrón de rayas.',
    scientificName: 'Synophis plectovertebralis',
    assetPath: "assets/animals/serpiente_dagua.jpg",
    soundPath: '',
  ),
  PuzzleImage(
    name: 'Gato Maracuyá',
    info:
        'El Gato Maracuyá (Leopardus wiedii) enfrenta amenazas debido a la destrucción de su hábitat.',
    scientificName: 'Leopardus wiedii',
    assetPath: "assets/animals/gato_maracuya.jpg",
    soundPath: '',
  ),
  PuzzleImage(
    name: 'Danta de Montaña',
    info:
        'La Danta de Montaña (Tapirus pinchaque) vive en los bosques de montaña de los Andes.',
    scientificName: 'Tapirus pinchaque',
    assetPath: "assets/animals/danta_montana.jpg",
    soundPath: '',
  ),
  PuzzleImage(
    name: 'Manatí',
    info:
        'El Manatí (Trichechus inunguis) enfrenta múltiples amenazas, incluyendo la caza, la contaminación y la pérdida de hábitat.',
    scientificName: 'Trichechus inunguis',
    assetPath: "assets/animals/manati.jpg",
    soundPath: '',
  ),
];

Future<Image> decodeAsset(ByteData bytes) async {
  return decodeImage(
    bytes.buffer.asUint8List(),
  )!;
}

class SPlitData {
  final Image image;
  final int crossAxisCount;

  SPlitData(this.image, this.crossAxisCount);
}

Future<List<Uint8List>> splitImage(SPlitData data) {
  final image = data.image;
  final crossAxisCount = data.crossAxisCount;
  final int length = (image.width / crossAxisCount).round();
  List<Uint8List> pieceList = [];

  for (int y = 0; y < crossAxisCount; y++) {
    for (int x = 0; x < crossAxisCount; x++) {
      pieceList.add(
        Uint8List.fromList(
          encodePng(
            copyCrop(
              image,
              x * length,
              y * length,
              length,
              length,
            ),
          ),
        ),
      );
    }
  }
  return Future.value(pieceList);
}

class ImagesRepositoryImpl implements ImagesRepository {
  Map<String, Image> cache = {};

  @override
  Future<List<Uint8List>> split(String asset, int crossAxisCount) async {
    late Image image;
    if (cache.containsKey(asset)) {
      image = cache[asset]!;
    } else {
      final bytes = await rootBundle.load(asset);

      /// use compute because theimage package is a pure dart package
      /// so to avoid bad ui performance we do this task in a different
      /// isolate
      image = await compute(decodeAsset, bytes);

      final width = math.min(image.width, image.height);

      /// convert to square
      image = copyResizeCropSquare(image, width);
      cache[asset] = image;
    }

    final pieces = await compute(
      splitImage,
      SPlitData(image, crossAxisCount),
    );

    return pieces;
  }
}
