CREATE DATABASE IF NOT EXISTS MySoupe;

USE MySoupe;

CREATE TABLE soup (
id int PRIMARY KEY auto_increment NOT NULL,
name char(100) NOT NULL,
picture char(255),
category char(50) NOT NULL,
continent char(50) NOT NULL,
season char(50) NOT NULL,
difficulty char(50) NOT NULL,
prepare_time int(11),
cook_time int(11),
isHot Boolean,
isCold Boolean,
vegan boolean,
lactoseFree boolean,
glutenFree boolean
);

CREATE TABLE ingredient (
id int PRIMARY KEY auto_increment NOT NULL,
name char(255) NOT NULL,
description char(255) NOT NULL,
picture char(255)
);

CREATE TABLE soup_ingredient (
id_soup int  NOT NULL,
FOREIGN KEY (id_soup) REFERENCES soup(id),
id_ingredient int NOT NULL,
FOREIGN KEY (id_ingredient) REFERENCES ingredient(id)
);

-- rentrer les soupes et les caracteristiques dans la base de donnée

INSERT INTO soup (name, picture, category, continent, season, difficulty, prepare_time, cook_time, isHot, isCold, vegan, lactoseFree, glutenFree) VALUES 
("Soupe de fenouil au saumon", "315417c7d91b374569d3a626ca14e791.png", "Poisson - Fruits de mer", "Europe", "Été", "Très facile", 5, 20, true, false, false, true, true),
("Bouillon thaï aux coquilles Saint-Jacques", "9316718d2af87ddeca68a0d0cc7dd348.png", "Poisson - Fruits de mer", "Asie", "Hiver", "Facile", 20, 20, true, false, false, true, true),
("Soupe de pommes de terre au haddock", "fb9739bf36c3994cdd8c4475564b3d59.png", "Poisson - Fruits de mer", "Europe", "Automne", "Facile", 15, 40, true, false, false, false, true),
("Bouillon d’asperges aux palourdes", "0199e25a617a3b826f28601132f5f839.png", "Poisson - Fruits de mer", "Europe", "Printemps", "Facile", 90, 20, true, false, false, true, true),
("Soupe saveur paella au poisson", "43a3934cf6a0e60393c3e971d1b2d71c.png", "Poisson - Fruits de mer", "Europe", "Été", "Très facile", 10, 20, true, false, false, true, true),
("Soupe thaï aux crevettes et lait de coco", "e0bffb199cb98241cbe604d01024fb50.png", "Poisson - Fruits de mer", "Asie", "Été", "Facile", 20, 20, true, false, false, true, true),
("Soupe de petits pois, roquette et saumon fumé", "34d55a589173295d4b8378dcae38a5e1.png", "Poisson - Fruits de mer", "Europe", "Été", "Facile", 10, 15, true, false, false, true, true),
("Soupe cioppino (tomates - persil et bar)", "227a1266eb13f2e393c19d190d4abbfa.png", "Poisson - Fruits de mer", "Amérique", "Été", "Facile", 15, 50, true, false, false, true, true),
("Soupe de moules à la provençale", "c8d7bf11c4cfe8f3b3aac66e5a7e127d.png", "Poisson - Fruits de mer", "Europe", "Été", "Facile", 25, 15, true, false, false, true, true),
("Soupe marine à la créole", "16b59e0c1e5962c807970ac1a1ea1b34.png", "Poisson - Fruits de mer", "Amérique", "Été", "Facile", 10, 15, true, false, false, true, true),
("Soupe scandinave au saumon", "fa4cd43236f09b139325a328a391c1a4.png", "Poisson - Fruits de mer", "Europe", "Automne", "Facile", 20, 25, true, false, false, false, true),
("Potage pékinois", "5fd04f82a3d2edbf640137596f2c3f29.png", "Végétarien", "Asie", "Hiver", "Facile", 40, 30, true, false, false, true, true),
("Rassolnik", "036442df2bb8fb9f8e5b4ef46036b380.png", "Végétarien", "Europe", "Hiver", "Facile", 5, 50, true, false, true, true, true),
("Bouillon asiatique au tofu soyeux et aux champignons", "69ec9ccd2c8aeff6dd4ff879e45959d7.png", "Végétarien", "Europe", "Hiver", "Facile", 30, 135, true, false, true, true, true),
("Minestrone", "4ea267930b035a64527e2a97c9ced375.png", "Végétarien", "Europe", "Hiver", "Facile", 20, 40, true, false, true, true, false),
("Soupe comme un dahl", "6f5046df2ffb3cad0ff4c6ada26ab690.png", "Végétarien", "Asie", "Hiver", "Facile", 10, 45, true, false, true, true, false),
("Soupe au quinoa et aux légumes verts", "154d5f4d472ee360b6ff756845abacbe.png", "Végétarien", "Europe", "Printemps", "Facile", 20, 20, true, false, true, true, true),
("Soupe à la dauphinoise", "c1afa0f2936918f151a487a2dbd544c1.png", "Végétarien", "Europe", "Automne", "Facile", 20, 30, true, false, false, false, true),
("Soupe de choux de Bruxelles aux marrons", "4d686a152046cace8d3d62d69536bb3e.png", "Végétarien", "Europe", "Automne", "Facile", 10, 25, true, false, false, false, true),
("Soupe d’orge et pois chiches au yaourt", "98b3d97955baae203451923a442037e6.png", "Végétarien", "Europe", "Automne", "Facile", 730, 45, true, false, false, false, true),
("Soupe de quinoa au maïs, poivrons et haricots rouges", "cbb5258f637056f16da67e4261b63d0a.png", "Végétarien", "Amérique", "Été", "Facile", 15, 25, true, false, true, true, true),
("Soupe de légumes primeurs aux nouilles soba", "24e7ff17f311de1ba7b53a929885e3e4.png", "Végétarien", "Asie", "Printemps", "Facile", 25, 15, true, false, true, true, true),
("Soupe de légumes, pâtes au pistou et jambon blanc", "05af640797144b70bda5abaf712ad2e4.png", "Viande", "Europe", "Hiver", "Très facile", 15, 15, true, false, false, true, true),
("Bortsch au bœuf", "d8c530c0cfcbfda91c04e6551962d6a2.png", "Viande", "Europe", "Hiver", "Facile", 20, 45, true, false, false, false, true),
("Soupe de lentilles au jambon cru", "401676dea2ae9a600f34f46b417d0e11.png", "Viande", "Europe", "Hiver", "Facile", 25, 35, true, false, false, true, true),
("Phô", "9ee3fbbdff4824682ff39ea84b5dd201.png", "Viande", "Asie", "Hiver", "Moyen", 25, 40, true, false, false, true, true),
("Soupe paysanne à l’irlandaise", "8dc5caba07550bc244fa3c3c795b9a5f.png", "Viande", "Europe", "Hiver", "Facile", 10, 30, true, false, false, true, true),
("Soupe de fèves à la sauge et au filet de bacon", "360afa7eef4c8829cfd4f4c366554687.png", "Viande", "Europe", "Hiver", "Facile", 20, 20, true, false, false, true, true),
("Soupe complète aux haricots noirs", "bdadfb82e127b505d955076a7b800b16.png", "Viande", "Europe", "Hiver", "Facile", 970, 90, true, false, false, true, true),
("Soupe de légumes et poulet au lait de coco et curry", "51c40268ffd31e8bb28ae5a523bf8e02.png", "Viande", "Asie", "Hiver", "Facile", 10, 60, true, false, false, true, true),
("Harira", "f40e63e2892b30035b60db85fac58892.png", "Viande", "Afrique", "Hiver", "Facile", 740, 60, true, false, false, true, true),
("Soupe écossaise au poulet et aux pruneaux", "5a62b86d11f8b6ef48dc4710c26407f6.png", "Viande", "Europe", "Hiver", "Très facile", 10, 45, true, false, false, true, true),
(),

-- rentrer les ingredient dans la base de données 

insert into ingredient (name, description, picture) values 
("Ail", "Plante (Liliacées) dont le bulbe (tête) à odeur forte et saveur piquante est utilisé comme condiment (ailler).", "b96b4456669b8ecd80fff93e5e048558.jpg"),
("Asperges vertes", "Chaque couleur d'asperge se distingue par un goût et des caractéristiques différentes : l'asperge verte par exemple n'a pas besoin d'être pelée, contrairement à la blanche et à la violette.", "ce9eb6a0fdc73bb57bc242d223400efa.jpg"),
("Basilic", "Le Basilic commun est largement employé dans la cuisine italienne, d'autres variétés de basilic sont répandues dans certaines cuisines asiatiques : Taïwan, Thaïlande, Viêt Nam, Cambodge et Laos.", "7be4449a70764e2309f607969fb033b3.jpg"),
("poireau", "Le poireau est une espèce de plante herbacée vivace largement cultivée comme plante potagère pour ses feuilles consommées comme légumes.", "0b12082eb5cb90ccc030c71cb62e5b0d.jpg"),
("Blettes", "Elle est cultivée comme plante potagère pour ses feuilles ou pour ses côtes (ou cardes), consommées comme légume en France.", "b73d9b9653fa07161d6b4c968dbc94d5.jpg"),
("Bouillon de légumes", "Le bouillon de légumes est un liquide passé et décanté obtenu en faisant cuire doucement des légumes dans de l'eau bouillante.", "10916e1861ff0e2dc91e7891e331b554.jpg"),
("Bouquet garni (thym, feuilles de laurier, romarin)", "Le bouquet garni est un assortiment de plantes aromatiques traditionnelles (fraîches, ou séchées) de la cuisine française.", "15802300c834023715e45de9f79b27dd.jpg"),
("Carottes" , "La carotte est  largement cultivée pour sa racine pivotante charnue, comestible, de couleur généralement orangée, consommée comme légume.", "142a0691b5b216440deac06549f904e4.jpg"),
("Carottes primeurs", "La carotte primeur est une carotte précoce, récoltée de mai à juillet.", "d619594b756c59aa513c4e5a035ffe00.jpg"),
("Céleri-rave", "Le céleri-rave est une plante herbacée bisannuelle de la famille des Apiacées, tribu des Apieae. Elle est cultivée comme plante potagère pour la base de sa tige tubérisée consommée comme légume.", "493f2e9bae582ea5f784dbc873518e02.jpg"),
("Céleri-branche", "la branche de céleri a faible teneur en sucre et la quasi-absence de lipides font aussi du céleri un allié de la glycémie et du bon cholestérol.", "867ac36bdffded870c744d314812e0fe.jpg"),
("Champignons de paris", "Les champignons de Paris ont des lamelles roses lorsque le champignon est jeune, puis brun-noir à noires en vieillissant.", "5e9f4f13fcdc3702ced649d910fb34ad.jpg"),
("Champignons noirs", "C'est un champignon cartilagineux en forme d'oreille qui pousse sur le bois mort. Il est largement cultivé en Asie et fait partie des traditions culinaires notamment chinoise et japonaise depuis de nombreux siècles.", "41d08e66fb10bfee0e17547c9498f56e.jpg"),
("Choux bruxelles", "Le chou de Bruxelles est une variété de chou, cultivée pour ses bourgeons axillaires qui forment de petites têtes pommées, consommées comme légume.", "aa3648ff0fce3609d873c301064a2015.jpg"),
("Ciboule", "La ciboule, entre ciboulette et oignon, côté saveur, la ciboule rappelle l'oignon (partie blanche ou rouge, selon la variété) ou la ciboulette (partie verte).", "3ccf19b85c2a801a6c7a6669d919b974.jpg"),
("Ciboule de chine", "La ciboule chinoise est une plante bulbeuse, vivace, herbacée, de 70 cm de haut environ, son goût, proche de celui de l'ail, est plus piquant et poivré que celui de la ciboulette commune.", "49600638dae5b399e3766eb462eee627.jpg"),
("Ciboulette commune", "Les feuilles fraîches sont utilisées, crues, ciselées, pour aromatiser les crudités, les salades, et diverses préparations culinaires comme les autres fines herbes.", "e4531e214984a57f15f287542c62aa47.jpg"),
("Coriandre", "Les feuilles sont généralement utilisées fraîches en accompagnement ou comme condiment. Les fruits séchés, souvent confondus avec des graines, sont utilisés comme épice. Moulus, ils sont un ingrédient de base de nombreux mélanges.", "75aa067c40ad7205e2880d0126e26492.jpg"),
("Courge butternut", "Ou la doubeurre est Le nom français qui  évoque le goût de cette courge, en particulier le velouté que sa texture permet d'obtenir en cuisine.", "37919dd6badc4cf23f3c9653d311b1b5.jpg"),
("Courgettes", "La courgette est un fruit de forme allongée ou ronde, et de couleur verte ou jaune. Bien qu'il s'agisse d'un fruit au sens botanique du terme parce qu'elle contient les graines de la plante, elle est communément utilisée comme un légume.", "174736770c4d09201840168f192eb98d.jpg"),
("Crème liquide", "La crème fraîche est une crème non stérilisée, maturée ou laissée en l'état. Elle est produite à partir de lait de vache, sachant que la crème de lait de brebis est également commercialisée.", "7cdddfecee2dc7be61ac83017ab4eaaf.jpg"),
("curcuma", "Le curcuma, ingrédient principal des carry ou curry, il est considéré comme une plante exceptionnelle en regard de ses nombreuses propriétés (épice, conservateur de nourriture, agent colorant, cosmétique et médicinal).", "fc55bff852803ab7dbb058d874f0cf93.jpg"),
("Curry en poudre", "le curry n'est pas une épice mais un mélange qui sont le gingembre, la coriandre, la cardamome, le clou de girofle, le fenugrec, la graine de moutarde, l'anis, le fenouil, l'ail, et surtout le curcuma qui lui donne sa couleur jaune caractéristique.", "533690121294b371714bed0d085ab133.jpg");
("Échalotes", "La plante est très voisine de l'oignon. La saveur de l'échalote est également plus marquée que celle de l'oignon.", "e8e746c2bbc50f620f9631a5df22c771.jpg"),
("Estragon", "Les feuilles d'estragon sont utilisées, fraîches ou séchées ou en poudre pour aromatiser des plats ainsi que les conserves au vinaigre. L'estragon fait partie des fines herbes.", "e40e17c43b45a8fa1dc9fc268116e0dd.jpg"),
("Fécule de maïs", "La fécule de maïs est utilisé comme agent épaississant dans les aliments à base de liquide (par exemple, les soupes , les sauces , les sauces , la crème anglaise ).", "d6452469fb85d2af04ba584cd7febc4f.jpg"),
("Fèves fraîches écossées", "Le fruit est une gousse contenant des graines de forme ovale et aplatie avec une peau épaisse, les fèves qui ont la forme d'un gros haricot aplati.", "8f8dfcb1bf75f813b4bb4fbec3f08b75.jpg"),
("Fromage frais", "Fromage frais est une appellation désignant un fromage jeune, sans croûte formée, élaboré à partir de lait, lait écrémé, de petit-lait ou de composants du lait, et dont la pâte n'a pas été affinée.", "f9336ad9f0caedcfc427076c8047c67e.jpg"),
("Gingembre frais", "Plante, originaire des Indes et de Malaisie, cultivée dans les pays chauds, dont le tubercule aromatique a un goût très poivré et légèrement citronné.", "64f287f05fc79c1daaa74dc3c8bc9603.jpg"),
("Graines de coriandre", "Les graines de coriandre sont presque parfaitement rondes et ressemblent à des grains de poivre nervurés, marron très clair.", "05793203a6abc333ee74bcbf18098ec0.jpg"),
("Graines de cumin", "Herbe ombellifère aromatique aux feuilles finement découpées, dont la graine est utilisée comme condiment sous le même nom.", "2e1a67d529bb98084b0e2f5ed749bac1.jpg"),
("Grains de poivre", "Le poivre est une épice obtenue à partir des baies de différentes espèces de poivriers, des plantes de la famille des pipéracées.", "a47703c99d7ba8b3e1ab896e313587b0.jpg"),
("Gros cornichons malossol", "Les cornichons malossol sont une variété de gros cornichons, plus douce, moins acide que nos petits cornichons, ils sont préparés avec plus d'aromates et du sucre.", "e8809763b0bc92d03bc658c6991463fd.jpg"), 
("Haricots blancs", "Haricot blanc est une expression désignant diverses variétés du haricot commun (Phaseolus vulgaris) dont le grain est de couleur blanche. Il est également désigné sous les noms de coco, lingot, mogette...", "d8650d279150d26f265ff4d8e978ec41.jpg"),
("Haricots rouges", "Le haricot rouge, un légume sec connu de tous que l'on consomme aussi bien l'été que l'hiver. Cette légumineuse, fortement consommée, possède de nombreuses vertus.", "f929d90ea22231b4ff7503da074998a1.jpg"),
("Haricots verts", "Les haricots verts sont des gousses immatures du haricot commun consommées comme légumes. Selon les variétés, leur couleur peut varier entre le jaune, le vert et le violet.", "48f2897fc7cfeb73eff1bb9033bae1e6.jpg"),
("Huile de coco", "L’huile de coco et l'huile de coprah sont des huiles végétales fabriquées à partir de l'albumen de la noix de coco.", "e027cf008f54d436b2830bcca81b56f5.jpg"),
("Huile de tournesol", "L’huile de tournesol est une huile végétale obtenue à partir des graines de tournesol.", "96da5bb2a130ef2a6720fb8831309c31.jpg"),
("Huile d'olive", "L’huile d'olive est une variété d'huile alimentaire, à base de matière grasse végétale extraite des olives lors de la trituration dans un moulin à huile. Elle est un des fondements de la cuisine méditerranéenne.", "fc60761792c0cf50804be8f4e4a23092.jpg"),
("Jus de saumure", "Préparation liquide fortement salée, parfois additionnée d'aromates et d'ingrédients divers, destinée à la conservation de certains aliments (viandes, poissons, légumes, etc.).", "3a6b0342d8cda9ae93522fb4355be360.jpg"),
("Lait demi-écrémé", "Le lait demi-écrémé est un lait standardisé par l'industrie laitière dont le taux de matières grasses est ajusté entre 1,5 et 1,8 %.", "fbe4eadf1012ecec26b38b2e3332a963.jpg"),
("Lentilles corail", "La lentille corail appartient à la famille des fabacées, plus couramment appelée la famille des « légumineuses ». Elle doit son nom à sa couleur rose saumon qui lui offre un pouvoir très attractif. Consommée en soupe, en Dahl ou en Curry.", "05efc592f272e47b80298376ee5bf29c.jpg"),
("Maïs", "Céréale de la famille des graminées cultivée pour ses grains comestibles.", "f5f92db2f4b5479cc2ed5e060c1c72f4.jpg"),
("Marrons", "Le marron est l'appellation donnée à une châtaigne qui répond à des critères de belle forme : le fruit est gros, rond et non cloisonné.", "1f2da06d8f795ca7d83d0a92d34bc891.jpg"),
("Menthe fraîche", "La menthe fraîche doit être très aromatique, avec des feuilles bien drues, des tiges vertes et fermes et non brunies et ramollies par le trempage dans l'eau. Elle se trouve également surgelée ou séchée.", "aec79a0da8ec0d962b33f02924c48818.jpg"),
("Naans", "Galette de pain cuite au four (cuisine indienne).", "2c5b9d99ec1f9d7a1e13e49fc44c0945.jpg"),
("Navets", "Le navet est aussi bon cru que cuit ! C'est d'ailleurs cru qu'il nous apporte le plus de vitamines et de minéraux.", "526d316a0fe97fe99e3e71163e42f229.jpg"),
("Noisettes concassées", "Fruit du noisetier, petite coque contenant une amande comestible.", "d658c1b240d823ca659c0d5e4550c031.jpg"),
("Nouilles de soba", "Pâtes japonaises à la farine de sarrasin.", "526b512f557d18365011da357c36ef18.jpg"),
("Œuf bio", "Comme l'œuf classique mais  l'alimentation doit être composée à 100% de végétaux, minéraux et vitamines dont 95% minimum des matières premières sont issues de l'agriculture biologique.", "11b1cfde9d9fd3841e5a76db1a615a0d.jpg"),
("Œufs", "Corps dur et arrondi que produisent les femelles des oiseaux, qui contient le germe de l'embryon et des substances nutritives.", "11b1cfde9d9fd3841e5a76db1a615a0d.jpg"),
("Oignon", "Plante potagère vivace, à bulbe ; ce bulbe est souvent utilisé en cuisine.", "01576c403ae9603fa435d8aad4ba3f1a.jpg"),
("Oignon nouveau", "Disponible de mars à juillet, l'oignon primeur, aussi appelé « oignon nouveau » ou « oignon frais », se récolte durant la tubérisation.", "6f33e722795e38104be3324a38e5e261.jpg"),
("Orge mondé", "L'orge mondé a été poli un peu plus afin de cuire plus rapidement. Il s'agit également d'un grain entier.", "f9941337e99528f8d49f96f6194b1c9b.jpg"),
("Orge perlé", "L'orge perlé a été poli encore un peu plus. Il a été débarrassé de l'enveloppe de son, alors il n'est plus un grain entier.", "25a3c6831a66092de03960b8d2416c7e.jpg"),
("Paprika en poudre", "Le paprika, aussi appelé poivre rouge, est une épice encore moulue dans la plus pure tradition. Bien que l'on puisse faire du paprika à partir de n'importe lequel piment.", "7c1ab2d549a26167c07530a6a32712df.jpg"),
("Pâtes courtes", "Préparation plus ou moins consistante, à base de farine délayée, que l'on consomme après cuisson.", "6172ffa886b111b1e658dc08075f9475.jpg"),
("Persil frisé", "Le persil frisé supporte mal la chaleur et convient donc plutôt pour la cuisine froide.", "c352c94ec52c98c6edaaaa1723b627d9.jpg"),
("Persil plat", "Le persil plat est le mieux adapté à la cuisson: son arôme est plus intense et il supporte bien la chaleur.", "491696e9082933e605ba83b2ca430952.jpg"),
("Petits pois frais", "Les petits pois, pois de jardins, ou pois potagers sont les jeunes graines vertes de variétés cultivées du pois. Elles sont généralement récoltées après leur développement dans les gousses et avant leur maturité.", "33e3ceab7d3b71b16ac2deda38101772.jpg"),
("Piment d'espelette", "Le piment d'Espelette en français ou ezpeletako biperra en basque est un produit agricole. Il s'agit d'un piment spécifique cultivé au Pays basque", "3bdffb25e422af9d121aec03db38971b.jpg"),
("Pois chiches cuit", "Plante à fleurs blanches, à gousses contenant chacune deux graines ; graine jaunâtre de cette plante.", "ac8c700a3813776d337bccc303b332fa.jpg"),
("Poivre noir de Sichuan", "Sa saveur est effectivement poivrée, légèrement citronnée et très parfumée. Il produit une sensation déroutante en bouche.", "53ebfdeff7abb00c446ff11996b282ee.jpg"),
("Poivre blanc", "Le poivre blanc est un poivre qui a été récolté à pleine maturité puis débarrassé de son enveloppe. Le résultat donne un poivre à l'arôme plus subtil, plus doux avec une saveur beaucoup moins piquante que celle du poivre noir.", "afbb81a3e0717388f41a9ef38e805e68.jpg"),
("Poivron rouge", "Ces baies sont récoltées à différents stades de maturité donnant une couleur caractéristique aux graines de poivre. Pour un poivre rouge, les baies sont arrivées à maturité complète puis séchées.", "812cbec83dd2cae20a24c843be333c4f.jpg"),
("Pomme de terre", "La pomme de terre ou patate est un tubercule comestible", "c253e94e50cad0ae25e65394852e45c5.jpg"),
("Pousse de bambou", "Les pousses de bambous sont les jeunes pousses comestibles (pointes des nouvelles tiges, ou chaumes, de bambous qui sortent du sol)", "5003c841025776ba83981cb90d5a60db.jpg"),
("Pulpe de tomates", "Il s'agit de la chair crue de la tomate, coupée en petits morceaux, assez proche encore des tomates fraîches.", "91bc1a1e78e8903471e3a85553942cba.jpg"),
("Quinoa", "Le quinoa est une toute petite graine nutritive dont le goût rappelle celui de la noisette. On le prépare et on l'utilise comme le riz, mais sa cuisson est plus rapide.", "862cfcd6a957832675b20c3df8bfe547.jpg"),
("Sauce soja", "La sauce soja est un liquide de couleur ambrée, brunâtre à rougeâtre, plus ou moins foncé. Riche en acides aminés libres, elle a une saveur prononcée et très salée.", "fb4ef5526c84025aa26bd64dbb06d396.jpg"),
("Sel" , "Substance blanche, friable, soluble dans l'eau, d'un goût piquant, et qui sert à l'assaisonnement et à la conservation des aliments.", "16053702d872425e02842b3b95580973.jpg"),
("Shiitaké", "Le shiitake est de texture douce et spongieuse et il libère une saveur boisée et terreuse lorsque cuit.", "0c57d1dea6eeb10953658012ff32f9a8.jpg"),
("Sucre de canne", "Le sucre de canne, aussi appelé cassonade, est lui naturellement roux, en raison des pigments colorés contenus dans la canne à sucre.", "adb73c9029d21c1a34df0e9d7a06273d.jpg"),
("Thym", "Plante aromatique des régions tempérées, abondante dans les garrigues et les maquis, utilisée en cuisine.", "5a846848463ffc5015e14049f5b722d2.jpg"),
("Tofu", "Le tofu ou fromage de soja est un aliment d'origine chinoise, issu du caillage du lait de soja. C'est une pâte blanche, molle, peu odorante et au goût plutôt neutre.", "b16927a52b80c368ceb0abfb9ddf1355.jpg"),
("Tomates", "La tomate est une espèce de plantes herbacées du genre Solanum de la famille des Solanacées, originaire du Mexique.", "44509795148e9a0904905ff594eedb13.jpg"),
("Vermicelles", "Les vermicelles sont de bonnes sources de vitamines et minéraux : vitamines du groupe B et magnésium particulièrement.", "495a2065ea18958da6628fecb0d55464.jpg"),
("Vermicelles de riz", "Le vermicelle de riz est un dérivé très fin des nouilles de riz.", "0343821799ca5bee94068ab129c046a6.jpg"),
("Vinaigre de riz", "Le vinaigre de riz est un vinaigre obtenu par fermentation acétique d'un vin de riz. Il y a trois types de vinaigre de riz : blanc, noir et rouge.", "28b1adb44f93696908f252b47ee334b4.jpg"),
("Yaourt grec", "le yaourt grec est un yaourt qui a été filtré pour éliminer la majeure partie de son lactosérum , ce qui donne une consistance plus épaisse que le yaourt normal non filtré, tout en préservant son caractère distinctif. goût aigre du yaourt.", "bfeabcad4cc841c78bc5328f78ce333b.jpg");
("Aneth", "Ses feuilles et ses graines très aromatiques et se rapproche vaguement du fenouil par son odeur et ses propriétés, d'où ses autres noms de « fenouil bâtard » ou « faux anis ».", "bf38f09e5c56385ad2d2ebd16a788f33.jpg"),
("Anis étoilés", "La badiane chinoise, ou anis étoilé, est le fruit du badianier de Chine (Illicium verum), utilisée comme épice en cuisine pour son goût anisé.", "08473952c3da2a828a7d0fe635fc45e6.jpg"),
("Betteraves", "La betterave, est cultivées  pour la production du sucre, comme légume dans l'alimentation humaine, comme plantes fourragères, et plus récemment comme biocarburant avec le bioéthanol.", "9f92fd3996c5843bf1f04c7c612a613a.jpg"),
("Blancs de poulet", "La poitrine est une viande blanche et maigre située sur le buste de l'animal. Ce morceau, aussi appelé filet ou blanc de poulet, prend le nom de suprême une fois coupé en deux.", "2182550d81a531b25c4298ff79204466.jpg"),
("Bœuf à mijoter", "le gîte, provenant de la cuisse du bœuf, est idéal pour la cuisson à mijoter et le collier qui est riche en collagène , ce qui lui permet d'avoir une texture gélatineuse lorsqu'il est cuit à mijoter.", "87b442507aef4b8bd8d75905605f2594.jpg"),
("Bouillon", "Liquide obtenu par la cuisson prolongée de viandes (bœuf, veau, poule), de légumes dans de l'eau salée bouillante", "89c85385affbf2c5462bba039acaa72e"),
("Bouquet de coriandre","Les feuilles de coriandre sont parfois appelées cilantro, persil arabe, persil mexicain ou persil chinois.", "6a9661e1383ce2d44d6283022fbe7d18.jpg"),
("Fond de veau", "Un fond  de veau  est une garniture aromatique, réduit pour en augmenter la consistance et qui sert généralement à la préparation des sauces.", "74a66b9054b157877bfd6ea3261363c2.jpg"),
("Cannelle", "Écorce aromatique du cannelier utilisée en cuisine.", "2aad0452cddd55181d50973a90b89285.jpg"),
("Cardamome", "La cardamome verte a une saveur intense qui est à la fois poivrée, sapinée, piquante et citronnée.", "a039e29279452a79a6d11bb62bf70db3.jpg"),
("Citron", "le citron est utilisé pour son parfum en cuisine et en pâtisserie.", "c274a6cc5f889f1a49eec68fa298489a.jpg"),
("Clous de girofle", "Les clous de girofle sont les  bouton des fleurs du giroflier desséché utilisé comme épice.", "26c49832f9432864ef9f2fc158488aa1.jpg"),
("Colier d'agneau", "Le collier d'agneau est un morceau charnu, économique et savoureux. C'est le cou de l'animal et il pèse environ 1 kg. Très osseux, il donne un jus gélatineux lorsqu'il mijote longuement.", "69175b5b0d83c8f65dc075394b79b249.jpg"),
("Concentré de tomates", "Préparation culinaire épaisse, composée de tomates pelées et épépinées dont on a extrait le liquide par évaporation, qui entre dans la composition de sauces, de ragoûts et de soupes.", "24973450c03be1a1d50f162e57ad769c.jpg"),
("Cuisse de poulet", "La cuisse se compose du haut de cuisse et du pilon. Il s'agit d'un morceau connu pour sa tendreté et sa jutosité.", "ee1138d305acec532d95ef72ee8d1e01.jpg"),
("Cuisses de canard", "La viande de la cuisse de canard a une saveur riche, qui est souvent décrite comme étant plus robuste que celle du poulet. Elle a une légère note sucrée et une texture juteuse.", "e082e1e2628033c6cbd623785c1ed17e.jpg"),
("épinard (jeunes pousses)", "Les pousses d'épinards sont utilisés, cru ou cuit, haché ou en branches.", "8926c29f24b5e46caaa915e6da33d605.jpg"),
("Farine de blé", "La farine de blé est le résultat de la mouture de la graine du blé tendre ou froment.", "63eefa2a79b147fb098958475a9ab9b2.jpg"),
("Filet de bacon en trache fines", "Le bacon est le terme anglais pour désigner du lard salé (et parfois fumé)", "b21038fe504aca8059dddb9cbcab538b.jpg"),
("Gigot", "le gigot est le membre postérieur de l'agneau.", "f8d6699f75ddab17ef01a0fe4a6eda0d.jpg"),
("Graisse de canard", "La graisse de canard à des notes légèrement sucrées", "8fd2030378e0fcc697e0bafcba0bca4e.jpg"),
("Haricots noirs", "Les haricots noirs, comme tous les légumes secs, sont parmi les aliments d'origine végétale les plus riches en protéines, tout en étant dépourvus de graisses", "3bbba8b8a4ece4986c5e5996910b587f.jpg"),
("Jambon blanc", "Le jambon cuit, dit jambon blanc, est tout simplement un jambon salé. Sa salaison est effectuée par saumurage.", "691f6b96416a7dbb32957627befd2bca.jpg"),
("Jambon cru", "le jambon cru, partiellement séché, se distingue en premier lieu par son temps de séchage.", "fb78371cbcd029b9a6edd43473ab5ce0.jpg"),
("Julienne de légumes", "En cuisine, la julienne est une manière de tailler les légumes, en minces lanières de 4 à 5 cm sur 1 mm d'épaisseur.", "80d42914d9aabbc6002e432ed5852715.jpg"),
("Lait de coco", "C'est un jus végétal peu sucré intéressant d'un point de vue nutritionnel mais pas seulement… Il est aussi riche en minéraux ", "d07a1d64f913a8e7da128a00eb3e0c75.jpg"),
("Laurier", "Les feuilles de Laurier sont très appréciées en cuisine mais également en phytothérapie. Elles sont recommandées en cas de digestion difficile et de perte d'appétit.", "d434246b42bf97b9734c71361b7c3daa.jpg"),
("Lentilles vertes", "Les lentilles sont une riche source de protéines, ce qui en fait une excellente alternative à la viande ou au poisson.", "46a9c34335a4cc10cf51ac1f0f42a9e2.jpg"),
("Macaronis courts", "Les macaroni coupés sont des pâtes tubulaires qui peuvent se présenter sous diverses tailles et avec une surface lisse ou striée.", "1b3a0eccb04172dae532eaeb1b8facce.jpg"),
("Pain de seigle", "Le pain de seigle permet, grâce à ses nutriments, de contribuer à une alimentation équilibrée.", "42301e2ee0543e5e6f7d795875a708bd.jpg"),
("Parmesan", "Le Parmesan, appelé en Italie le Parmigiano Reggiano est une variété des fromages italiens à l'aspect granuleux connus sous l'appellation générique de Grana.", "a1d314e50a1cfcaeae0429409583ff8d.jpg"),
("chou rouge", "le choux rouge à une forte teneur en vitamines C et K, ainsi que beaucoup d'antioxydants. En outre, il fournit du magnésium, du potassium et du fer.", "d816e840da03623efc5ab5e0dc60fd5e.jpg"),
("chou vert", "Le chou est une très bonne source de vitamine C et de bêtacarotène. Il contient également des vitamines du groupe B. Ces antioxydants protègent l'organisme des agressions extérieures. Des minéraux.", "65a113533c922b6fa4d9658f44c7f888.jpg"),
("Piment", "Le piment est bon pour la santé sous toutes ses formes et combinaisons. Il stimule l'appétit et la circulation sanguine, agit contre l'indigestion et les ballonnements, aide à soulager tensions et douleurs musculaires.", "9950fe645685e2207e74efd6e4ced83d.jpg"),
("Poivron rouge", "Les poivrons rouges sont les plus sucrés puisqu'il s'agit de fruits cueillis à pleine maturité.", "416d13257e839378c6b70a42071aecea.jpg"),
("Pruneau", "Véritable concentré d'énergie, ce sont des fruits riches en fibres, en vitamine E, une bonne source de fer et aussi riche en calcium.", "58cf3a3d21d0d1217c3434cf123d0d84.jpg"),
("Safran", "Le safran est un sublime exhausteur de goût, il exalte les saveurs de nombreux aliments tout en dévoilant son parfum si particulier. Goût mielleux avec des légères nuances métalliques", "e515bce206af5812dd149b45e9faabac.jpg"),
("Sauge", "La sauge est une plante aromatique et médicinale originaire du bassin méditerranéen. Connue pour ses vertus digestive, cicatrisante et stimulante.", "89dcf81bf2c06258c0c18e1e3f91b37b.jpg"),
("Vinaigre de vin", "C'est un liquide qui résulte de la transformation de l'alcool du vin (ou d'un autre alcool) en acide acétique au contact de l'air.", "7c722aff69b69779ee1252736599adde.jpg"),
("Saumon", "Il est en effet particulièrement riche en minéraux et vitamines, dont en premier lieu la vitamine A, vitamine E et Sélénium impliqués dans le défenses antioxydantes du sportif, un large éventail de vitamines du groupe B, et vitamine D.", "b6cdb6171c012ab112d509707b991d88.jpg"),
("Noix de saint-jacques", "Musclée et bien blanche, la Saint-Jacques fraîche est reconnue comme un mets délicat, au goût de noisette, légèrement iodé et à la chair tendre.", "7416cbfe52a00e60a408dd7254e3dce4.jpg"),
("Haddock", "Du fait de sa consistance et de son goût salé, le haddock a un effet rassasiant, très utile pour un repas hypocalorique.", "b779e3398f64e6445f4a1100305486c1.jpg"),
("Palourde", "La palourde se distingue par les nuances de couleur de sa coquille qui est plus grosse que celle de la coque. Sa chair iodée est proche de celle de la moule et a un petit goût de noisette.", "6a245527963b63b9b5a4681a2bc6ff82.jpg"),
("Cabillaud", "Le cabillaud est recherché car son goût est doux, ce qui permet à de nombreuses personnes peu portées sur la consommation du poisson d'en manger malgré tout.", "4bcf88a206f9b59530fc909903ea7192.jpg"),
("Cocktail de fruits de mer", "Il y est retrouvé des crustacés comme les homards, le crabe, les crevettes, ainsi que des mollusques et des coquillages tels que les huîtres, les moules et les palourdes.", "bf011f823510f9f09fdc5c5f5cdd1c47.jpg"),
("Crevette", "La crevette est une source de protéines : 100 g de crevettes contiennent 19 g de protéines, idéales pour le maintien de la masse musculaire.", "a9b07f4d3d9493c0416b5715a4d4d2c7.jpg"),
("basilic thaï", "Elle a des feuilles vertes fines et pointues avec ses tiges et des inflorescences pourpres. Elle est très utilisée dans la cuisine thaïlandaise.", "4ecb4bfeae0f45b5309d80f89e4232de.jpg"),
("Nuoc mâm", "Le nuoc-mâm est une sauce à base de poisson fermenté dans une saumure. À partir d'une saumure, la macération est effectuée durant 12 mois dans des jarres au soleil ou des fûts en bois.", "b989c5215ff519837597c5a2fbb4b6e6.jpg"),
("Pâte de curry rouge", "La pâte de curry rouge thaïlandaise de base. La coloration rouge dérive des piments rouges séchés. L' ingrédient principal est le piment rouge séché", "626da9f7ff153460d70668e47b68d6ee.jpg"),
("Pâte de curry vert", "Le nom « vert » du curry dérive de la couleur du plat, qui vient des piments verts.", "1ef1b047b3490c975bbb532027d1166e.jpg");

-- crée la table compositions afin de crée les etapes de la recette.

CREATE TABLE soup_etape (
id_soup int  NOT NULL,
FOREIGN KEY (id_soup) REFERENCES soup(id),
n_etape int NOT NULL,
etape text NOT NULL
);

insert into soup_etape(id_soup, n_etape, etape)values
(1, 1, "Hacher finement fenouil, oignon, aneth puis couper en petits cubes saumon."),
(1, 2, "Chauffez le bouillon dans une casserole."),
(1, 3, "Faites revenir le fenouil, l’oignon et l’aneth avec l’huile 1 minute dans une casserole à feu vif."),
(1, 4, "Faites revenir le fenouil, l’oignon et l’aneth avec l’huile 1 minute dans une casserole à feu vif."),
(1, 5, "Ajoutez les tomates concassées et poursuivez la cuisson 2 minutes."),
(1, 6, "Mixez rapidement au robot plongeant."),
(1, 7, "Ajoutez le saumon et poursuivez la cuisson 4 minutes."),
(1, 8, "Servez en parsemant de quelques feuilles d’aneth."),
(2, 1, "Retirez les feuilles externes des tiges de citronnelle et coupez-les en tronçons."),
(2, 2, "Pelez et râpez le gingembre. Épluchez, dégermez etémincez l’ail. Épépinez et hachez le piment."),
(2, 3, "Faites cuire le riz en suivant les indications sur le paquet."),
(2, 4, "Faites chauffer la moitié de l’huile de coco dans une cocotte puis ajoutez la citronnelle, le gingembre, l’ail, le piment et 1 pincée de sel.
Laissez mijoter 3 minutes."),
(2, 5, "Ajoutez le lait de coco, le bouillon et la sauce de poisson, portez à ébullition, puis laissez mijoter sur feu doux une quinzaine de minutes. Mixez."),
(2, 6, "Filtrez le bouillon à l’aide d’une passoire fine en pressant les ingrédients pour recueillir le maximum de saveurs. Assaisonnez."),
(2, 7, "Faites chauffer l’huile de coco restante dans une poêle. Salez et poivrez les noix de Saint-Jacques et faites cuire 2 minutes de chaque côté."),
(2, 8, "Servez le bouillon sur un peu de riz, garnissez de coquilles Saint-Jacques, de quelques cacahuètes grillées et de graines germées.
Donnez un tour de moulin à poivre."),
(3, 1, "Détaillez les filets de haddock en gros morceaux. Mettez-les dans une sauteuse et recouvrez d’eau. Faites chauffer 15 minutes sans dépasser le seuil de l’ébullition. Retirez le haddock de l’eau sans la jeter."),
(3, 2, "Épluchez les pommes de terre et taillez-les en gros cubes. Rincez et coupez le poireau en rondelles. Épluchez l’oignon et émincez-le."),
(3, 3, "Dans une cocotte ou un faitout, faites suer dans l’huile les rondelles de poireau et l’oignon émincé. Ajoutez les pommes de terre, 75 cl d’eau de cuisson du haddock avec le laurier et le lait, et portez à ébullition. Faites cuire à frémissement pendant 20 minutes : les pommes de terre doivent être très tendres. Pendant ce temps, ôtez la peau et les arêtes du haddock et effeuillez-le."),
(3, 4, "Une fois que la cuisson de la soupe est terminée, retirez le laurier et réservez 4 belles cuillerées de légumes."),
(3, 5, "Ajoutez un tiers du haddock dans la soupe puis, à l’aide d’un mixeur plongeant, broyez-la plus ou moins grossièrement en fonction de votre goût. Au besoin, ajoutez un peu d’eau de cuisson. Goûtez et rectifiez l’assaisonnement."),
(3, 6, "Servez la soupe dans des assiettes creuses, répartissez un peu de légumes, du haddock effeuillé et arrosez de 1 trait de crème."),
(4, 1, "Préparez les palourdes. Faites-les dégorger dans de l’eau pendantau moins 1 heure (jusqu’à 12 heures)."),
(4, 2, "Dans une casserole, faites chauffer le vin blanc avec le persil et le jus du citron. À frémissement, ajoutez les palourdes et faites cuire jusqu’à ce qu’elles s’ouvrent (jetez celles qui restent fermées !). Filtrez en conservant le jus de cuisson."),
(4, 3, "Pendant la cuisson des palourdes, retirez la partie dure de la base des asperges et coupez le reste en rondelles en conservant les pointes entières."),
(4, 4, "Coupez la citronnelle en tronçons de 3 cm. Rincez la branche de céleri et coupez-la en fines rondelles. Épluchez et ciselez l’oignon. Épluchez, dégermez et émincez les gousses d’ail."),
(4, 5, "Dans une casserole, faites suer l’ail et l’oignon dans 1 cuillerée à soupe d’huile, puis ajoutez la partie dure des asperges, la citronnelle, le laurier, le thym et 1,1 litre d’eau. Portez à ébullition et faites cuire 15 minutes à petit frémissement. Filtrez."),
(4, 6, "Dans une cocotte, chauffez l’huile restante et faites-y revenir 2 minutes les rondelles et pointes d’asperges. Ajoutez le bouillon filtré précédemment et le jus de cuisson des palourdes et portez de nouveau à ébullition."),
(4, 7, "Hors du feu, ajoutez les palourdes. Servez aussitôt parsemé de ciboulette ciselée."),
(5, 1, "Faites revenir à feu moyen dans une sauteuse l’oignon émincé, l’ail hachée, le poivron coupé en cubes et le chorizo avec l’huile d’olive pendant 5 minutes environ en remuant régulièrement."),
(5, 2, "Ajoutez le riz, les petits pois, les tomates coupée en cubes, le safran et le court-bouillon et laissez cuire 15 minutes à feu moyen."),
(5, 3, "Incorporez le poisson et les fruits de mer, salez et poivrez et prolongez la cuisson de 5 minutes."),
(5, 4, "Répartissez dans des bols ou des assiettes creuses, parsemez de persil et servez avec les quartiers de citron."),
(6, 1, "Pelez et hachez finement l’oignon et le gingembre. Pelez, dégermez et hachez finement l’ail. Coupez la citronnelle en tronçons de 3 cm."),
(6, 2, "Dans une cocotte, chauffez l’huile de coco et faites-y revenir l’oignon, l’ail et le gingembre hachés. Ajoutez 10 cl d’eau et la pâte de curry, et poursuivez la cuisson à feu moyen 2 minutes tout en remuant. Versez 50 cl d’eau, remuez, portez à ébullition et laissez mijoter 10 minutes."),
(6, 3, "Pendant ce temps, faites cuire les nouilles de riz comme indiqué sur le paquet."),
(6, 4, "Dans le bouillon, ajoutez le lait de coco, la citronnelle et la sauce nuoc-mâm et portez de nouveau à ébullition. Ajoutez les crevettes et poursuivez la cuisson 4 minutes."),
(6, 5, "Répartissez les nouilles dans 4 bols et versez le bouillon. Garnissez de crevettes et parsemez de menthe et de basilic fraîchement ciselés. Servez bien chaud avec quelques quartiers de citron vert."),
(7, 1, "Faites fondre les trois quarts des oignons et la roquette dans une casserole, à feu doux, dans l’huile d’olive pendant 3 minutes, en remuant régulièrement."),
(7, 2, "Ajoutez les petits pois, le curry et le bouillon, salez, poivrez et laissez cuire une douzaine de minutes."),
(7, 3, "Ajoutez la moitié des feuilles de menthe et mixez finement au robot plongeant."),
(7, 4, "Versez dans des assiettes creuses, répartissez sur les soupes le saumon taillé en lanières ainsi que les oignons et les feuilles de menthe restants."),
(8, 1, "Faites dorer l’oignon haché dans une poêle avec 1 filet d’huile d’olive et 1 pincée de sel pendant 5 à 7 minutes. Faites revenir l’ail hachée et l’origan 2 à 3 minutes, versez le vin blanc et laissez-le réduire 4 minutes."),
(8, 2, "Ajoutez les tomates entières pelées avec leur jus en les malaxant bien avec les mains, parsemez de persil. Laissez mijoter 15 minutes environ."),
(8, 3, "Versez le jus de palourde et 1,5 litre d’eau. Salez, poivrez et laissez cuire encore 15 minutes."),
(8, 4, "Coupez le bar en petits morceaux, ajoutez-le à la soupe avec les tomates cerises préalablement lavées et les olives grossièrement hachées et laissez cuire à couvert pendant 5 minutes. Parsemez de coriandre, assaisonnez et servez aussitôt."),
(9, 1, "Grattez et lavez soigneusement les moules."),
(9, 2, "Dans une sauteuse, versez le vin blanc et faites-le chauffer. Ajoutez les moules et faites-les ouvrir à feu vif. Retirez-les à l’aide
d’une écumoire et filtrez le jus de cuisson. Réservez-le. Décoquillez les moules en en conservant 12 (pour 4 personnes)  dans leur coquille."),
(9, 3, "Retirez les premières feuilles du bulbe de fenouil et taillez-le en petits cubes. Pelez, épépinez et hachez la tomate. Épluchez et ciselez finement l’oignon."),
(9, 4, "Dans une cocotte, faites revenir dans l’huile d’olive les cubes de fenouil, la tomate hachée et l’oignon ciselé. Versez le jus de cuisson des moules et 75 cl d’eau. Portez à ébullition. "),
(9, 5, "Ajoutez les vermicelles et les pistils de safran, faites-les cuire le temps indiqué sur le paquet. Puis, 2 minutes avant la fin de la cuisson, ajoutez les
moules. Goûtez et rectifiez l’assaisonnement."),
(9, 6, "Servez aussitôt dans des assiettes creuses."),
(10, 1, "Pelez et émincez l’oignon. Pelez, dégermez et émincez l’ail."),
(10, 2, "Versez l’huile dans une casserole et faites-y revenir l’oignon et l’ail émincés, 5 minutes à feu moyen, en remuant régulièrement."),
(10, 3, "Ajoutez les tomates pelées , copées en morceaux et 20 cl d’eau, salez, poivrez et laissez cuire 5 minutes, puis mixez."),
(10, 4, "Versez dans une autre casserole 40 cl d’eau, le gingembre, le piment, le safran et les feuilles de laurier et laissez cuire 5 minutes à feu moyen."),
(10, 5, "Ajoutez le poisson coupé en morceaux et poursuivez la cuisson 5 minutes."),
(10, 6, "Versez alors le tout dans la première casserole, ajoutez le crabe et laissez cuire encore 5 minutes."),
(10, 7, "Versez dans des assiettes creuses et parsemez de persil."),
(11, 1, "Épluchez les pommes de terre et les carottes, et taillez-les en cubes de 1 cm d’épaisseur. Rincez et émincez le poireau. Lavez la branche de céleri, taillez-la en rondelles et ciselez les feuilles. Épluchez et ciselez l’oignon."),
(11, 2, "Portez le bouillon à ébullition avec les légumes, la feuille de laurier et les grains de poivre. Couvrez et laissez cuire à frémissement pendant 20 minutes."),
(11, 3, "Pendant ce temps, détaillez le saumon en cubes de 4 cm de côté. Rincez, séchez et ciselez l’aneth."),
(11, 4, "Dans le bouillon, ajoutez les cubes de saumon et la crème liquide et poursuivez la cuisson 5 minutes."),
(11, 5, "Au moment de servir, parsemez de feuilles de céleri et d’aneth ciselé et accompagnez la soupe de tartines de pain de seigle."),


(12, 1, "Faites tremper les champignons noirs séchés dans un bol d’eau tiède pendant 30 minutes, puis taillez-les en morceaux. Nettoyez et émincez les shiitakés. Épluchez et taillez la carotte en julienne. Pelez et hachez l’oignon et sa tige. Coupez le tofu en cubes de 1 cm. Dans un bol, délayez la fécule de maïs avec 10 cl d’eau. Battez l’oeuf en omelette."),
(12, 2, "Dans un wok (ou une sauteuse), chauffez l’huile et faites-y sauter l’oignon, les champignons noirs, les shiitakés et les pousses de bambou. Ajoutez la sauce soja, le sucre et la carotte, puis poursuivez la cuisson 2 minutes. Versez le bouillon et portez à ébullition. Versez la fécule délayée et faites épaissir sans cesser de remuer."),
(12, 3, "Baissez le feu. Versez l’oeuf battu, le vinaigre de riz, les dés de tofu et le poivre blanc. Mélangez doucement et servez aussitôt parsemé de coriandre et de ciboulette fraîchement ciselées."),


(13, 1, "Épluchez les carottes et les pommes de terre puis taillez-les en morceaux. Rincez le blanc de poireau rapidement sous un filet d’eau. Retirez les radicelles. Émincez le blanc finement. Épluchez les échalotes puis émincez-les finement. Coupez les cornichons en morceaux de taille moyenne."),
(13, 2, "Faites revenir le blanc de poireau, les échalotes et le paprika dans une cocotte avec l’huile d’olive. Ajoutez les carottes et les pommes de terre ainsi que le bouquet garni. Salez et poivrez. Mouillez avec le bouillon de légumes. Ajoutez ensuite l’orge perlé, les morceaux de cornichon et le persil effeuillé."),
(13, 3, "Faites cuire 45 minutes à feu moyen et presque à couvert (laissez juste une toute petite ouverture)."),
(13, 4, "Retirez le bouquet garni. Ajoutez le jus de saumure des cornichons. Mélangez et servez aussitôt (en ajoutant un peu d’eau si la soupe vous semble trop épaisse)."),



(14, 1, "Épluchez le gingembre et les carottes, nettoyez le poireau, puis coupez-les en gros tronçons. Épluchez les gousses d’ail. Coupez le céleri en gros morceaux. Dans une grande casserole, versez 1,5 litre d’eau. Ajoutez la sauce soja, les morceaux de gingembre, de carottes, de poireau, de céleri, les gousses d’ail, les grains de poivre et les graines de coriandre. Laissez mijoter à couvert sur feu moyen pendant 2 heures."),
(14, 2, "Nettoyez et émincez finement les champignons. Émincez finement les ciboules. Coupez le tofu en petits cubes. Réservez."),
(14, 3, "Filtrez le bouillon, puis portez-le à ébullition et faites-y cuire les vermicelles de riz et les champignons pendant 15 minutes."),
(14, 4, "Répartissez le bouillon, les vermicelles et les champignons entre 4 bols et ajoutez les cubes de tofu et les ciboules émincées. Servez aussitôt."),



(15, 1, "Écossez les haricots frais. Équeutez et coupez les haricots verts en tronçons de 2 cm. Épluchez les carottes et les pommes de terre et coupez-les en petits dés de 0,5 cm ainsi que les courgettes. Lavez et coupez en rondelles les branches de céleri. Pelez, épépinez et hachez les tomates. Épluchez et ciselez l’oignon."),
(15, 2, "Dans une cocotte ou un faitout, faites revenir à feu doux l’oignon avec l’huile d’olive. Ajoutez tous les légumes coupés en petits dés et les haricots frais. Versez le bouillon. Portez à ébullition, couvrez et laissez cuire à frémissement pendant 30 minutes. Ajoutez les pâtes et poursuivez la cuisson le temps indiqué sur le paquet. Goûtez et rectifiez l’assaisonnement."),
(15, 3, "Servez aussitôt parsemé de basilic fraîchement ciselé et de 1 filet d’huile d’olive."),


(16, 1, "Rincez les lentilles sous l’eau froide. Épluchez et coupez en rondelles les carottes. Pelez et ciselez l’oignon. Pelez, dégermez et hachez les gousses d’ail. Pelez et coupez en tout petits morceaux le gingembre."),
(16, 2, "Dans une cocotte, faites chauffer l’huile et ajoutez-y l’oignon, l’ail, le gingembre et les graines de cumin. Faites revenir, le temps que l’oignon devienne translucide. Ajoutez le curry et le curcuma et mélangez. Versez 1,5 litre d’eau, les carottes, la pulpe de tomates et les lentilles. Portez à ébullition et poursuivez la cuisson 40 minutes à couvert et à frémissement."),
(16, 3, "À l’aide d’un mixeur plongeant ou d’un blender, mixez la soupe en ajoutant au besoin un peu d’eau en fonction de la consistance désirée. Goûtez et rectifiez l’assaisonnement."),
(16, 4, "Servez la soupe parsemée de quelques feuilles de coriandre, saupoudrée de curry et accompagnée de naans."),



(17, 1, "Faites revenir les oignons pendant 5 minutes dans une casserole à feu moyen, avec l’huile d’olive, en remuant régulièrement."),
(17, 2, "Ajoutez le quinoa, mélangez, puis versez le bouillon et laissez cuire le temps indiqué sur l’emballage : comptez 10 à 15 minutes."),
(17, 3, "Cinq minutes avant la fin de la cuisson du quinoa, ajoutez tous les légumes, le curcuma et la moitié du basilic grossièment hachés. Salez et poivrez à votre goût."),
(17, 4, "Servez la soupe dans des bols ou des assiettes creuses, parsemez le basilic restant et versez 1 trait d’huile d’olive."),



(18, 1, "Épluchez la courge, les navets et les pommes de terre et taillezles en cubes de 1 cm. Lavez les blettes, puis émincez finement les côtes et les feuilles au couteau."),
(18, 2, "Dans un faitout, chauffez l’huile d’olive et laissez-y suer les cubes de courge, de navets et de pommes de terre. Ajoutez le lait et 75 cl d’eau. Salez. Portez à ébullition et laissez frémir pendant 15 minutes. Ajoutez les blettes émincées et les vermicelles et poursuivez la cuisson 10 minutes."),
(18, 3, "Servez bien chaud, parsemé de basilic ciselé."),



(19, 1, "Dans une casserole, chauffez l’huile d’olive et laissez revenir l’oignon coupé en dés et le thym 5 minutes à feu moyen, en remuant régulièrement."),
(19, 2, "Ajoutez les pommes de terre coupées en cubes et les choux de Bruxelles coupés en deux et prolongez la cuisson de 5 minutes à couvert, salez et poivrez."),
(19, 3, "Ajoutez les marrons cuits au naturel, le bouillon et laissez cuire 12 minutes de plus."),
(19, 4, "Ajoutez le fromage frais dans la casserole et passez le tout au mixeur plongeant (/conservez quelques marrons et choux de Bruxelles pour la présentation finale)/"),
(19, 5, "Servez dans des assiettes creuses, répartissez les marrons et les choux de Bruxelles réservés, puis parsemez de noisettes concassées et décorez de 1 trait de crème."),



(20, 1, "Mettez l’orge mondé à tremper pendant 12 heures. Au bout de ce temps, égouttez-le et faites-le cuire dans un grand volume d’eau froide non salée 30 minutes à compter de l’ébullition. Filtrez en récupérant 1 litre d’eau de cuisson."),
(20, 2, "Pelez et ciselez finement les oignons. Effeuillez et ciselez la menthe et émincez la tige d’oignon nouveau."),
(20, 3, "Dans une cocotte, faites revenir à l’huile d’olive les oignons ciselés pendant quelques minutes. Ajoutez l’orge cuit, les pois chiches et l’eau de cuisson, puis faites chauffer à feu moyen."),
(20, 4, "Dans un saladier, mélangez le yaourt avec les oeufs. Versez dessus une louche d’eau de cuisson de la soupe et mélangez. Renouvelez l’opération deux fois, puis versez ce mélange dans la soupe. Faites chauffer en remuant le temps que la soupe arrive à frémissement."),
(20, 5, "Parsemez de menthe ciselée et d’oignon nouveau émincé et servez aussitôt."),



(21, 1, "Rincez abondamment les graines de quinoa à l’eau froide."),
(21, 2, "Rincez les poivrons, retirez le pédoncule, les graines et les membranes blanches, puis taillez-les en petits cubes. Coupez les épis de maïs en tronçons de 2 à 3 cm. Épluchez et ciselez finement l’oignon. Pelez, dégermez et hachez les gousses d’ail."),
(21, 3, "Dans une cocotte, chauffez l’huile et faites-y revenir 5 minutes les vdés de poivrons, l’ail et l’oignon. Ajoutez le quinoa rincé, les tronçons de maïs et le bouillon. Portez à ébullition, couvrez et faites cuire à petit frémissement 10 minutes. Ajoutez les haricots rouges et continuez la cuisson 10 minutes. Goûtez, rectifiez l’assaisonnement : salez, poivrez ou pimentez."),
(21, 4, "Servez bien chaud."),



(22, 1, "Écossez les petits pois. Pelez les carottes et coupez-les en rondelles. Lavez les asperges, retirez la partie dure de la base et coupez le reste en rondelles de 1 à 2 cm en conservant les pointes. Ciselez les oignons et 10 cm de leur tige. Pelez la tête d’ail, retirez les gousses et émincez-les finement."),
(22, 2, "Dans un faitout, faites suer quelques minutes les oignons et l’ail avec l’huile. Versez le bouillon et portez à ébullition. Ajoutez les légumes et poursuivez la cuisson 10 minutes. Goûtez et rectifiez l’assaisonnement."),
(22, 3, "Pendant ce temps, faites cuire les nouilles soba comme indiqué sur le paquet. Égouttez-les et répartissez-les dans 4 bols."),
(22, 4, "Versez aussitôt le bouillon aux légumes, parsemez d’estragon fraîchement ciselé et arrosez de 1 filet d’huile d’olive."),



(23, 1, "Pelez et hachez l’oignon. Émincez le jambon en lamelles."), 
(23, 2, "Faiteschauffer l’huile dans une cocotte. Ajoutez l’oignon haché, le jambon, puis la julienne surgelée. Mélangez et laissez dorer 5 minutes à feu vif."),
(23, 3, "Versez le bouillon. Poivrez. Portez à ébullition. Ajoutez les pâtes et laissez cuire 10 minutes à feu vif."),
(23, 4, "Pendant la cuisson de la soupe, pelez, dégermez et hachez l’ail, rincez le basilic et détachez les feuilles."),
(23, 5, "Ajoutez-les dans la soupe au moment de servir. Parsemez de parmesan et servez bien chaud."),
(24, 1, "Taillez la viande en cubes de 3 cm. Épluchez et râpez à la grille àgros trous les betteraves et la carotte."),
(24, 2, "Pelez la pomme de terre et coupez-la en dés."),
(24, 3, "Retirez les premières feuilles du chou rouge si elles sont abîmées, ôtez le coeur et taillez le reste en fines lanières."),
(24, 4, "Épluchez et émincez l’oignon."),
(24, 5, "Dans une cocotte, chauffez l’huile et faites revenir la viande et l’oignon. Ajoutez les betteraves et la carotte râpées, les dés de pomme de terre, le bouillon, la feuille de laurier, le concentré de tomates et le vinaigre. Portez à ébullition, puis faites cuire à couvert et à frémissement pendant 30 minutes. l’assaisonnement."),
(24, 6, "Ajoutez le chou émincé et poursuivez la cuisson 15 minutes. Goûtez et rectifiez"),
(24, 7, "Servez le bortsch accompagné de crème, d’aneth ciselé et de tranches de pain de seigle."),
(25, 1, "Versez 1 litre d’eau dans une cocotte. Ajoutez les lentilles vertes, du sel, du poivre, le thym et le laurier. Couvrez, laissez mijoter 15 minutes à partir de l’ébullition."),
(25, 2, "Pelez et lavez les carottes et l’oignon. Coupez-les en dés, ajoutezles dans la cocotte. Couvrez et faites cuire 20 minutes."),
(25, 3, "Faites dorer les noisettes 3 minutes dans une poêle antiadhésive, laissez tiédir, puis hachez-les grossièrement. Émincez finement le jambon, faites-le griller quelques instants dans une poêle très chaude, sans matière grasse. Rincez et effeuillez le persil, puis hachez-le."),
(25, 4, "Mixez la soupe après avoir retiré le thym et le laurier. Ajoutez du sel, le jambon et l’huile d’olive. Répartissez dans 4 bols ou assiettes creuses, saupoudrez de noisettes et de persil haché, et servez bien chaud."),
(26, 1, "Préchauffez le four en position gril à 240 °C (th. 8)."),
(26, 2, "Épluchez les oignons et coupez-les en deux. Nettoyez les shiitakés en retirant les pieds. Pelez les carottes et coupez-les en rondelles. Lavez le poireau et émincez-le. Épluchez et coupez en lamelles le gingembre."),
(26, 3, "Faites rôtir 5 à 10 minutes les oignons sous le gril."),
(26, 4, "Dans une cocotte chaude, faites torréfier les épices (cannelle, cardamome, anis étoilé, girofle, coriandre et poivre), sans cesser de remuer, jusqu’à ce que les parfums se développent. Versez le bouillon et ajoutez les oignons grillés, la sauce soja et le sucre, les légumes, le gingembre, les chapeaux de shiitakés, le laurier, le thym et le persil. Portez à ébullition et poursuivez la cuisson à frémissement pendant 30 minutes."),
(26, 5, "Pendant ce temps, préparez la garniture. Faites cuire les nouilles de riz comme indiqué sur le paquet. Coupez le boeuf en fines tranches. Rincez et effeuillez les herbes fraîches. Coupez la ciboule en fines rondelles. Coupez le citron vert en quartiers."),
(26, 6, "Garnissez 4 grands bols avec les nouilles, les lamelles de viande et quelques pousses de soja. Ajoutez le bouillon bien chaud et servez. Chacun pourra ensuite garnir son phô d’herbes et de ciboule, de jus de citron et de graines de sésame."),
(27, 1, "Versez l’huile dans une sauteuse et faites revenir l’oignon haché finement, le céleri coupées en fines tranches, l’ail écrasée et le laurier 5 minutes à feu moyen en remuant régulièrement."),
(27, 2, "Ajoutez la viande en petits cubes  et faites-la colorer 3 minutes en remuant."),
(27, 3, "Incorporez le bouillon, les pommes de terre , les carottes et les navets coupées en petits cubes salez, poivrez et faites cuire l’ensemble pendant 20 minutes."),
(27, 4, "Versez dans des bols, saupoudrez de persil et servez aussitôt."),
(28, 1, "Pelez et lavez les carottes et l’oignon. Rincez la courgette. Coupez les légumes en dés."),
(28, 2, "Portez à ébullition de l'eau avec du poivre. Ajoutez les légumes et les fèves. Couvrez et laissez cuire 20 minutes."),
(28, 3, "Émincez les tranches de bacon en fines lamelles. Faites-les revenir dans l’huile d’olive, avec les feuilles de sauge coupées en deux, à feu vif pour les rendre croustillantes."),
(28, 4, "Mixez la soupe, versez dans les bols ou assiettes creuses, ajoutez le bacon et la sauge, un peu de piment si vous le souhaitez et servez aussitôt."),
(29, 1, "Placez les haricots noirs dans un grand bol avec de l’eau et laissez tremper 1 nuit au réfrigérateur."),
(29, 2, "Égouttez-les, puis faites-les cuire 1 heure 15 à 1 heure 30 dans de l’eau non salée avec les échalotes, préalablement épluchées et hachées, et le cumin. Égouttez."),
(29, 3, "Portez le bouillon à ébullition. Lavez et coupez les tomates en dés, ajoutez-les dans le bouillon avec les haricots, les jeunes pousses d’épinard lavées et le jambon blanc coupé en petits morceaux. Donnez un tour de moulin à poivre et servez."),
(30, 1, "Épluchez les pommes de terre et taillez-les en morceaux. Rincez le blanc de poireau et la branche de céleri. Retirez les radicelles à l’extrémité du poireau et émincez-le finement. Coupez le céleri en tronçons. Épluchez puis coupez les carottes en dés. Rincez le poivron, épépinez-le puis coupez-le en dés. Épluchez les échalotes puis émincez-les finement. Épluchez les gousses d’ail, retirez le germe et écrasez-les. Coupez le poulet en cubes. Réservez-les avec 1/3 des carottes et du poivron."),
(30, 2, "Faites revenir le poireau, les échalotes, l’ail et le curry dans une cocotte avec 1 filet d’huile d’olive. Ajoutez les pommes de terre, les carottes, le poivron, le céleri et le bouquet garni. Salez et poivrez. Mouillez avec le bouillon de volaille. Faites cuire 45 minutes à feu moyen et presque à couvert."),
(30, 3, "Retirez le bouquet garni. Mixez la préparation. Ajoutez le lait de coco, les pâtes, puis le blanc de poulet, la carotte et le poivron réservés. Laissez cuire à nouveau 10 minutes à feu moyen et à couvert."),
(30, 4, "Si la soupe vous semble trop liquide, n’hésitez pas à la faire réduire quelques minutes supplémentaires à feu moyen et à découvert. À l’inverse, si elle vous semble trop épaisse, ajoutez un peu d’eau."),
(31, 1, "La veille, faites tremper les pois chiches dans un grand volumed’eau."),
(31, 2, "Le jour même, égouttez les pois chiches. Coupez l’agneau en petits dés. Épluchez et émincez les oignons. Rincez, séchez, effeuillez et ciselez la coriandre et le persil."),
(31, 3, "Dans une cocotte, versez l’huile. Ajoutez la viande, les oignons, la coriandre et le persil ciselés, les pois chiches et les lentilles préalablement rincées sous l’eau froide, la pulpe de tomates et les épices. Salez, poivrez et mélangez bien. Versez 1,75 litre d’eau, remuez et portez à ébullition. Poursuivez la cuisson à feu doux et à couvert en mélangeant de temps en temps jusqu’à ce que les pois chiches et la viande soient bien cuits."),
(31, 4, "Pendant ce temps, diluez la farine avec 30 cl d’eau. Hors du feu, versez ce mélange dans la soupe tout en remuant. Remettez à cuire à feu doux pendant une dizaine de minutes en remuant égulièrement : la soupe épaissit."),
(31, 5, "Servez la harira chaude parsemée de quelques feuilles de coriandre et de quartiers de citron."),
(32, 1, "Coupez les cuisses de poulet en deux."),
(32, 2, "Portez le bouillon à ébullition dans une casserole. Ajoutez le poulet et la feuille de laurier, couvrez et faites cuire à frémissement pendant 30 minutes."),
(32, 3, "Pendant ce temps, rincez, épluchez et émincez les poireaux. Épluchez et taillez en petits cubes la carotte. Dénoyautez et coupez les pruneaux en quatre."),
(32, 4, "Retirez les cuisses de poulet du bouillon, ôtez la peau et détachez la chair en morceaux."),
(32, 5, "Ajoutez dans le bouillon les poireaux émincés, les petits cubes de carottes et les pruneaux et poursuivez la cuisson 15 minutes. Goûtez et rectifiez l’assaisonnement."),
(32, 6, "Répartissez les morceaux de poulet dans 4 bols, puis ajoutez les légumes et les pruneaux et arrosez de bouillon.");

-- crée les requetes sql pour les recherches sur le site.

select name,id form soup where name= %$laRecherche%;



-- creation de la base de donnée user 


CREATE DATABASE user_my_soup;

USE user_my_soup;

create table user(
id int primary key auto_increment NOT NULL,
nom varchar(100),
prenom varchar(100),
email varchar(255),
date_naissance date
)


insert into user
(nom, prenom, email, date_naissance)
values
("thollas", "olivier", "o_thollas@hotmail.com", "1984-02-17"),
("thollas", "fabien", "f_thollas@hotmail.com", "1986-06-24"),
("katono", "fuyumi", "katonofuyumi@hotmail.fr", "1991-11-18");


