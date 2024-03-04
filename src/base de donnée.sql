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
("Phô", "Viande", "9ee3fbbdff4824682ff39ea84b5dd201.png", "Asie", "Hiver", "Moyen", 25, 40, true, false, false, true, true),
("Soupe paysanne à l’irlandaise", "8dc5caba07550bc244fa3c3c795b9a5f.png", "Viande", "Europe", "Hiver", "Facile", 10, 30, true, false, false, true, true),
("Soupe de fèves à la sauge et au filet de bacon", "360afa7eef4c8829cfd4f4c366554687.png", "Viande", "Europe", "Hiver", "Facile", 20, 20, true, false, false, true, true),
("Soupe complète aux haricots noirs", "bdadfb82e127b505d955076a7b800b16.png", "Viande", "Europe", "Hiver", "Facile", 970, 90, true, false, false, true, true),
("Soupe de légumes et poulet au lait de coco et curry", "51c40268ffd31e8bb28ae5a523bf8e02.png", "Viande", "Asie", "Hiver", "Facile", 10, 60, true, false, false, true, true),
("Harira", "Viande", "f40e63e2892b30035b60db85fac58892.png", "Afrique", "Hiver", "Facile", 740, 60, true, false, false, true, true),
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


-- crée les requetes sql pour les recherches sur le site.

select name,id form soup where name= %$laRecherche%;

creation de la base de donnée user 


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
