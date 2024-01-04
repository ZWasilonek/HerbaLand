-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: herbaland
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `polish_plant_description`
--

DROP TABLE IF EXISTS `polish_plant_description`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `polish_plant_description` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `family` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `type` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `species` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `raw_material` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `active_compounds` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `plant_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `properties` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `traditional_use` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contraindications` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `synonyms` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `indications` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `comments` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `polish_plant_description`
--

LOCK TABLES `polish_plant_description` WRITE;
/*!40000 ALTER TABLE `polish_plant_description` DISABLE KEYS */;
INSERT INTO `polish_plant_description` VALUES (1,'Korzeń lukrecji','Bobowate (motylkowate)','Lukrecja','Lukrecja gładka','Korzeń','Surowiec zawiera saponozydy trójterpenowe (glicyryzyna) i flawonoidy (izolikwirytygenina). Pozostałe składniki (kumaryny, węglowodany) mają marginalne znaczenie.','Lukrecja występuje w Europie i Azji. Dorasta do mniej więcej półtora metra wysokości, ma skórzaste liście, a gdy kwitnie, pojawiają się na niej białe, fioletowe lub niebieskie kwiaty. Surowcem są wysuszone, całe lub rozdrobnione, podziemne części wymienionych wyżej gatunków lukrecji zawierające nie mniej niż 4% kwasu glicyryzynowego. Surowiec pozyskuje się z kilkuletnich roślin w okresie późnej jesieni lub wczesną wiosną. Suszenie surowca przebiega w temperaturze do 35 st. C','Obecność związków saponinowych sprawia, że surowiec ma działanie wykrztuśne i sekretolityczne. Wyciągi z lukrecji wykazują również działanie przeciwzapalne na błony śluzowe przewodu pokarmowego. Od dawna stosowana w leczeniu choroby wrzodowej. Saponiny nasilają też działanie antrazwiązków - dlatego korzeń lukrecji stanowi dodatek do niektórych preparatów o działaniu przeczyszczającym. Zawarta w lukrecji izolikwirytygenina zmniejsza napięcie mięśni gładkich w obrębie żołądka, jelit, oskrzeli, dróg żółciowych i, słabiej, moczowych. Badania in vitro wskazują na aktywność przeciwwirusową wodnych wyciągów z lukrecji. W badaniach zaobserwowano aktywność przeciwwirusową glicyryzyny wobec wirusa opryszczki. Potwierdzone zostało także działanie hamujące namnażanie wirusa HIV oraz RSV. Glicyryzyna, skutecznie neutralizuje wirusa SARS-CoV-2 w laboratorium poprzez hamowanie jednego z jego głównych enzymów. Wykazano również, że podawanie dużych dawek zawartej w surowcu glicyryzyny ma działanie hepatoprotekcyjne. Lukrecja ma słodki smak i w małych ilościach może być stosowana do słodzenia potraw.','W medycynie naturalnej wykorzystuje się korzeń lukrecji. Ma on dość charakterystyczny smak. Zawiera wiele substancji, są to m.in. glicyryzyny, flawonoidy, kumaryny i triterpeny. Wspomagają one prawidłową pracę układu pokarmowego, wspierają układ oddechowy. Ze względu na słodycz lukrecji, jest ona wykorzystywana do produkcji słodyczy. Możemy z niej również przyrządzić słodki napój. Same korzenie mogą być również żute lub stanowić bezpośredni dodatek do potraw.\r\nKorzeń lukrecji jest bardzo popularny w tradycyjnej medycynie azjatyckiej. Napar lukrecjowy zalecano jako naturalny środek wspomagający organizm w trakcie infekcji i osłabienia.','Lukrecji nie należy podawać dzieciom poniżej 4 roku życia, kobietom w ciąży i karmiącym piersią.','Słodzień, słodkie drzewo, słodki korzeń, Licorice Root, Lukrecja chińska','Wewnętrznie w mokrym kaszlu jako środek wykrztuśny, w chorobie wrzodowej i nieżycie żołądka - jako lek o działaniu przeciwzapalnym. Zewnętrznie na skórę - jako preparat przeciwzapalny.','Nie podawać dzieciom poniżej 4 roku życia. U dzieci stosujemy jedynie jako środek wykrztuśny. Nie stosować w ciąży i podczas karmienia piersią. Nie należy łączyć z lekami moczopędnymi, antyarytmicznymi i sterydowymi. Preparatów z lukrecji nie wolno stosować dłużej niż 4-6 tygodni. Długotrwałe ich zażywanie prowadzi do wzrostu wydzielania mineralokortykosteroidów, co wywołuje zatrzymywanie sodu i wody oraz zwiększoną utratę jonów potasu. Prowadzi to do obrzęków i hipokalemii.'),(2,'Kora dębowa','Bukowate','Dąb','Dąb Dąb szypułkowy, dąb bezszypułkowy, dąb omszony','Kora','Garbniki pochodne katechiny i kwasu elagowego. Oprócz tego kwasy: elagowy i galusowy, katechina i epikatechina. Małe ilości trójterpenów. W starszej korze występują flobafeny, które nie mają własności garbników.','Dęby kojarzą nam się przede wszystkim z długowiecznością. To duże i silne drzewa z rodziny bukowatych. Żyją (przeciętnie!) 700-1000 lat. Mają gruby pień i rozgałęzioną koronę. Rosną w strefie klimatu umiarkowanego, tylko na północnej półkuli ziemi. Dla wielu dawnych kultur, szczególnie Słowian, dąb był drzewem świętym. A jego korę od dawna wykorzystywano w celach leczniczych. Zresztą dawna medycyna jako surowiec wykorzystywała nie tylko korę, ale i liście, żołędzie, a nawet dębowe drewno. Surowcem jest wysuszona i rozdrobniona kora z młodych gałęzi wyżej wymienionych gatunków dębu, zawierająca nie mniej niż 3% garbnikóww przeliczeniu na pirogalol.','Surowiec ma działanie ściągające - wynikające z obecności dużej ilości garbników. Po zastosowaniu na skórę lub błony śluzowe działa przeciwzapalnie. Po podaniu doustnym surowiec ma właściwości zapierające i przeciwbiegunkowe. Jest to wynikiem łączenia się garbników z białkami śluzówki jelit, co hamuje napływ wody do światła jelita. Garbniki absorbują również toksyny znajdujące się w świetle przewodu pokarmowego. Surowiec wykazuje działanie bakteriobójcze (o szerokim spektrum) na drobnoustroje w przewodzie pokarmowym, jamie ustnej i na skórze. Hamuje krwawienia z drobnych naczyń. Odwar stosowano do przemywania skóry, płukania włosów, nasiadówek w trakcie infekcji intymnych. Uważano, że sprzyja zwiększeniu obrony organizmu przed bakteriami, wykazuje wsparcie dla działania ściągającego, pomaga przyspieszyć gojenie się ran, przyczynia się do zmniejszenia dolegliwości skórnych (np. trądziku). \r\nKora dębu stosowany jako płukanka do włosów była jedną z pierwszych naturalnych metod ich farbowania - delikatnie przyciemnia kolor, pozwala zatuszować siwiznę. Specyfik stosowano również do płukania jamy ustnej w przypadku chęci wspomożenia organizmu do zintensyfikowania procesów przeciwzapalnych. Z kolei wysuszoną, sproszkowaną korę wykorzystywano jako zasypkę.','Odwar stosowano do przemywania skóry, płukania włosów, nasiadówek w trakcie infekcji intymnych. Uważano, że sprzyja zwiększeniu obrony organizmu przed bakteriami, wykazuje wsparcie dla działania ściągającego, pomaga przyspieszyć gojenie się ran, przyczynia się do zmniejszenia dolegliwości skórnych (np. trądziku). Kora dębu stosowany jako płukanka do włosów była jedną z pierwszych naturalnych metod ich farbowania - delikatnie przyciemnia kolor, pozwala zatuszować siwiznę. Specyfik stosowano również do płukania jamy ustnej w przypadku chęci wspomożenia organizmu do zintensyfikowania procesów przeciwzapalnych. Z kolei wysuszoną, sproszkowaną korę wykorzystywano jako zasypkę.','Kory dębu nie powinny stosować kobiety w ciąży i karmiące piersią.','Korkodąb','Wewnętrznie w biegunkach, szczególnie pochodzenia bakteryjnego, zatruciach pokarmowych. Odwary bądź wyciągi alkoholowe z surowca stosuje się do okładów lub przemywań w stanach zapalnych skóry, jamy ustnej, w obrębie narządów płciowych i odbytu. Surowiec stosuje się również w przypadku nadmiernej potliwości dłoni i stóp.','W biegunce nie stosować dłużej niż 2- 3 dni bez konsultacji lekarza. Zewnętrznie nie dłużej niż 2-3 tygodnie. Nie stosować na duże powierzchnie uszkodzonej skóry, w trakcie chorób zakaźnych przebiegających z gorączką i w ciężkiej niewydolności serca. Garbniki zawarte w surowcu zmniejszają wchłanianie stosowanych równocześnie leków (szczególnie tych o charakterze zasadowym).'),(3,'Korzeń prawoślazu','Ślazowate','Prawoślaz','Prawoślaz lekarski','Korzeń','Śluz o charakterze kwaśnym, złożony z polisacharydów zawierających glukozę, laktozę i kwas galakturonowy. Surowiec zawiera ponadto skrobie i pektyny.','Naturalnie wystepuje w rejonie Morza Śródziemnego, chociaż obecnie możemy go spotkać również na zachodzie Europy, w niektórych regionach Azji i Ameryki Południowej. W medycynie ludowej prawoślaz jest znany i stosowany od stuleci. Najstarsze wzmianki o jego dobroczynnych właściwościach pochodzą ze starożytności. Prawoślaz ma prosta łodygę dorastająca do 150 cm wysokości, sercowate liście o ząbkowanych obrzeżach. W porze kwitnienia u szczytu łodygi wyrastają białe lub różowe kwiaty. Jak sama nazwa wskazuje, prawoślaz zawiera dużej ilości śluzu, którego najwięcej znajduje się właśnie w korzeniach. Surowiec zbiera się zwykle z roślin dwu letnich w lipcu lub jesienią. Korzenie po umyciu suszy się w temperaturze do 40 st. C.','Surowiec ma działanie osłaniające i zmiękczające. Śluz zawarty w surowcu upłynnia zalegającą na powierzchni śluzówek wydzielinę, ułatwia ruch nabłonka rzęskowego i odkrztuszanie. Jednak przede wszystkim śluz powleka błony śluzowe i osłaniaja je przed działaniem czynników drażniących, dlatego surowiec jest stosowany jako środek przeciwkaszlowy w infekcjach górnych dróg oddechowych. Korzeń prawoślazu jest wykorzystywany do sporządzania syropu przeciw kaszlowego Sirupus Altheae, który może być bezpiecznie stosowany u bardzo małych dzieci.','W tradycyjnym ziołolecznictwie korzeń prawoślazu stosowano przede wszystkim w przypadku problemów z górnymi drogami oddechowymi. Śluzy ułatwiają odkrztuszanie i usuwanie zalegającej wydzieliny. Uważano również, że działa przeciwbólowo i odkażająco, dlatego też stosowano go przy bólach gardła (w formie naparu do płukania). Preparaty na bazie korzenia prawoślazu stosowano również zewnętrznie, np. do przemywania ran, poparzeń lub łagodzenia skutków ukąszeń owadów. Zalecano je również przy problemach z układem pokarmowym (ułatwia trawienie, dobroczynnie wpływa na błonę śluzową żołądka i jelit).','Prawoślaz nie jest wskazany dla kobiet w ciąży lub karmiących piersią.','Topolówka lekarska, ślaz lekarski, ślaz prawdziwy, malwa prawdziwa','Jako środek przeciwkaszlowy w infekcjach górnych dróg oddechowych. Czasem jako środek osłaniający w zapaleniach i podrażnieniach błony śluzowej przełyku i żołądka. Rzadko zewnętrznie w leczeniu stanów zapalnych i podrażnień skóry.','Długotrwałe wewnętrzne stosowanie preparatów z prawoślazu może prowadzić do niedoborów soli mineralnych i witamin.'),(4,'Nasienie kozieradki','Bobowate (motylkowate)','Kozieradka','Kozieradka pospolita','Ziarno','Surowiec zawiera śluz w ilości około 25%, saponiny sterydowe (diosgenina), flawonoidy, trygonelinę (jest to alkaloid, występuje w ilości około 0,3%) oraz cholinę. Oprócz tego nasiona zawierają olej (tłusty), białko i inne związki jak aminy biogenne, kumaryny, olejek eteryczny, kwas nikotynowy, kwas fitynowy, alkohole cukrowe oraz witaminy PP, H, F, B1, sole mineralne żelaza, fosforu, potasu i wapnia, tłuszcze, białka, gorycze oraz karoten.','Jest to jednoroczna roślina. Dorasta do ok. 60 cm wysokości, ma trójdzielne liście oraz wytwarza żółte kwiaty. W medycynie naturalnej jako surowiec wykorzystywane są dojrzałe, wysuszone nasiona kozieradki pospolitej o wskaźniku pęcznienia nie mniejszym niż 6.','Dzięki zawartości śluzów surowiec działa powlekająco. Dodatkową jego zaletą jest obecność flawonoidów i saponin o działaniu przeciwzapalnym. Dlatego kozieradkę stosuje się często jako środek osłaniający w chorobie wrzodowej żołądka. Dzięki obecności nienasyconych kwasów tłuszczowych zmniejsza poziom cholesterolu. Surowiec obniża nieznacznie poziom cukru we krwi. Ze względu na obecność substancji o gorzkim smaku nieznacznie zwiększa łaknienie, a obecność tłuszczy i białek nadaje kozieradce wartości odżywcze.\r\nSurowiec wykorzystany jest jako źródło diosgeniny do produkcji hormonów steroidowych.\r\nZiarna kozieradki są szeroko wykorzystywane w kuchni. Stanową bardzo ważny składnik diety indyjskiej, występują w curry, falafelach, chutney\'ach, marynatach i wielu innych. ','Ziarna kozieradki w medycynie naturalnej miały przede wszystkim wzmacniać organizm w stanach osłabienia, wspierać w zapobieganiu anemii, odżywiać, a także sprzyjać regulacji pracy układu pokarmowego. Kozieradka bywa wybierana również przez alergików. Uważano również, że ziarna kozieradki dobrze oddziaływują na stawy i kości. Zalecano ją osobom w trakcie przeziębień i infekcji dróg oddechowych, bowiem uważano, że może wzmacniać odpowiedź immunologiczną organizmu. Wyciągi z kozieradki mogą również korzystnie wpływać na kondycję psychiczną człowieka.\r\nSpecyfiki stosowano również zewnętrznie na rany, oparzenia, owrzodzenia, miejsca ukąszeń owadów. Ziarna kozieradki są sprzymierzeńcem pięknych włosów - wzmacniają je, przeciwdziałając ich wypadaniu. Kozieradka zalecana jest do włosów suchych, zniszczonych, rozdwajających się.','Surowiec nieodpowiedni dla kobiet w ciąży i karmiących piersią.','Kozieradka lekarska, koniczyna grecka, fenegryka, greckie siano, kozioroźnik, boża trawka, Fenugreek.','Wewnętrznie w chorobie wrzodowej, oraz jako środek pomocniczy w hipercholesterolemii i cukrzycy. Środek ogólnie wzmacniający. Zewnętrznie: środek powlekający, przy ropnych zapaleniach skóry, czyrakach, egzemie. W Polsce surowiec jest stosowany głównie zewnętrznie','Zapach surowca zniechęca niektóre osoby do doustnego stosowania. Zapach ten przechodzi do mleka krowiego po dodaniu nasion do paszy. Dlatego w niektórych krajach stosuje się prażone nasiona.'),(5,'Nasienie lnu','Lnowate','Len','Len zwyczajny','Nasiona','Surowiec zawiera śluz (3-6%) i tłusty olej (do 40%) bogaty w glicerydy kwasu linolowego i olejowego. Oprócz tego glikozydy cyjanogenne np. linamaryna - znajdujące się wewnątrz nasiona lnu. Lignany. Len to jedno z najbogatszych roślinnych źródeł kwasów omega-3, a dokładnie kwasu α-linolenowego (ALA), który w organizmie jest prekursorem kwasów eikozapentaenowego (EPA) oraz dokozaheksaenowego (DHA). Siemię lniane zawiera także inne substancje biologicznie czynne, takie jak błonnik pokarmowy, lignany, fitosterole, witaminy (m.in. witaminę E, kwas foliowy, witaminę B2 i B6) oraz szereg składników mineralnych (wapń, magnez, potas, fosfor i cynk).','Surowcem są dojrzałe, wysuszone nasiona lnu zwyczajnego o wskaźniku pęcznienia nie mniejszym niż 4.\r\nW jaki sposób pić siemię lniane: \r\n Dorośli i dzieci powyżej 12 roku życia w celu leczenia zaparć powinni stosować 3 razy dziennie 5 gramów nasion w całości lub mielonych wymieszanych z wodą, które dodatkowo po połknięciu należy popić szklanką wody. Wypróżnienie następuje po około 24 godzinach. U młodszych dzieci, w wieku od 6 do 12 lat zaleca się połowę dawki. Jako środek przeczyszczający z reguły jest stosowane 2-3 dni.\r\n\r\nJako środek osłaniający błony śluzowe żołądka i jelit stosuje się kisiel (kleik) przygotowywany na zimno. 5-10g nasion zalewa się 150ml wody o temperaturze pokojowej. Po zalaniu wodą, należy odstawić na 30-60 minut w celu napęcznienia, po czym odcedzić przez sitko (pić napar bez nasion). Zamiast wody, do przygotowywania kleiku można również zastosować napar z ziela krwawnika lub kwiatów rumianku.\r\n\r\nDo użytku zewnętrznego na kompresy lub okłady używa się mielone siemię, 30-50g pokruszonych lub sproszkowanych nasion wymieszanych z niewielką ilością wody.','Maceraty z surowca stosowane zewnętrznie mają działanie zmiękczające i przeciwzapalne. Zawierają one śluz. Zastosowane wewnętrznie, po podaniu doustnym powlekają przełyk i ściany żołądka, utrzymują się na nich przez długi czas i chronią przed środkami drażniącymi. Ich działanie ochronne obserwuje się również w górnych drogach oddechowych. Podawane doustnie, nasiona, mają działanie przeczyszczające. Wynika to z pęcznienia śluzów w przewodzie pokarmowym, oraz lekkiego działania drażniącego glikozydów cyjanogennych (rozdrobnione nasiona). Zawarty w surowcu olej (Oleum lini) jest bardzo dobrym źródłem NNKT (wit. F). Wykazuje działanie regenerujące na skórę. \r\nFitosterole, zwłaszcza β-sitosterol, a dodatkowo kampesterol, sigmasterol i brasikasterol – substancje zmniejszające stężenie cholesterolu całkowitego i frakcji LDL. Podobne właściwości ma błonnik pokarmowy rozpuszczalny w wodzie, który również znajduje się w lnie.\r\nZwiązki lignanów, zwanych inaczej fitoestrogenami roślinnymi, neutralizują działanie wolnych rodników, które odpowiadają za starzenie się organizmu i uszkadzają DNA komórek, zwiększając ryzyko zachorowania na nowotwory. Ponadto lignany regulują gospodarkę hormonalną, co wpływa na zmniejszenie ryzyka zachorowania na niektóre nowotwory hormonozależne, takie jak nowotwór sutka czy prostaty (inaczej stercza lub gruczołu krokowego). Pojedyncze badania wskazują również, że związki te mogą łagodzić dolegliwości związane z menopauzą.\r\nTokoferoli, w szczególności γ-tokoferolu i α-tokoferolu o działaniu przeciwutleniającym, chroni organizm przed niekorzystnym działaniem wolnych rodników.','Może być stosowany w leczeniu takich dolegliwości jak zaburzenia żołądkowo-jelitowe. Preparaty z nasienia lnu mają udowodnioną skuteczność badaniami klinicznymi w zaparciach nawykowych. Nasienie lnu w medycynie ludowej ma zastosowanie w schorzeniach, takich jak: niedożywienie, przerost prostaty, ostre i przewlekłe stany zapalne przewodu pokarmowego, podrażnienia okrężnicy, czyraki, owrzodzenia, ropnie, oparzenia, odmrożenia, stany zapalne błony śluzowej jamy ustnej, gardła, kaszel i zespół jelita nadwrażliwego.','Niedrożność jelit oraz nagły ból brzucha nieznanego pochodzenia.','Siemie lniane','Macerat z nasion jako dobry środek powlekający w przewodzie pokarmowym (np. przy chorobie wrzodowej). Podobnie zewnętrznie na skórę i śluzówki. Nasiona całe bądź rozdrobnione, popijane wodą, jako środek o działaniu przeczyszczającym - w leczeniu zaparć nawykowych. Olej lniany ma zastosowanie w leczeniu odleżyn, oparzeń i stanów zapalnych skóry.','Ze względu na wysoką kaloryczność pacjenci z nadwagą powinni stosować surowiec odtłuszczony.'),(6,'Liść szałwi','Jasnotowate (Wargowe)','Szałwia','Szałwia lekarska','Liść','Zawiera do 2,5% olejku eterycznego (m.in. tujon, salwiol, eukaliptol, kamforę, cyneol, borneol i pinen), kwasy fenolowe, flawonoidy, garbniki katechinowe (do 8%), di- i triterpeny, fitosterole, flawonoidy, gorycze (karnozol) a także witaminy A, C i PP. Charakteryzuje się gorzkim smakiem o żywicznej lub kamforowej nucie, której intensywność i ostateczny wydźwięk uzależnione są od odmian.','Surowcem są całe lub pocięte i wysuszone liście szałwii lekarskiej. Cały surowiec musi zawierać nie mniej niż 15ml/kg, a pocięty nie mniej niż 10ml/kg olejku eterycznego w bezwodnej substancji roślinnej. Liście zbiera się z niekwitnących roślin.\r\nW Polsce i Europie szałwia jest powszechnie uprawiana ale wywodzi się z rejonu Morza Śródziemnego. Obecnie uprawiana bywa w przydomowych ogródkach w wielu rejonach świata, sprawdza się również jako domowa roślina doniczkowa. W naturalnych warunkach preferuje zdecydowanie dobrze nasłonecznione stanowiska o żyznej, bogatej w wapń glebie. Wyróżnia się podłużnymi, miękkimi liśćmi (niekiedy o wielokolorowym ubarwieniu) i fioletowymi kwiatami. Często bywa wykorzystywana jako aromatyczny dodatek do zup, mięs i sałatek, jednak jej stosowanie wymaga zachowania umiaru ze względu na gorzki smak ziela.','Wyciągi z szałwi posiadają działanie przeciwpotne. Ponadto wyciągi te wykazują działanie przeciwzapalne i hamują rozwój drobnoustrojów. Zmniejszają przepuszczalność naczyń włosowatych, a obecność garbników powoduje hamowanie krwawienia z drobnych ran w przewodzie pokarmowym. Surowiec pobudza wydzielanie soku żołądkowego. Przywraca prawidłową perystaltykę jelit, a szczególnie okrężnicy. Wyciągi obniżają nieznacznie poziom cukru we krwi, co może mieć znaczenie w leczeniu lekkich przypadków cukrzycy. Działa odkażająco.','Właściwości szałwii wykorzystywane są w medycynie ludowej już od stuleci. Przede wszystkim zalecano jej spożywanie małżonkom starającym się o potomka. W ludowych wierzeniach przypisywano szałwii właściwości wręcz magiczne – uważano, że każdy dom, który chce się uchronić przed działaniem złych mocy, powinien mieć w swoim ogródku przynajmniej jeden krzaczek szałwii. Ma on zagwarantować mieszkańcom dobrobyt i bezpieczeństwo. Szałwia jest niepozorną rośliną o wielu właściwościach, szczególnie cenioną za działanie odkażające i ułatwiające eliminację szkodliwych drobnoustrojów.','Ze względu na brak odpowiednich badań w tym kierunku nie są zalecane kobietom w ciąży i matkom karmiącym piersią. Duże dawki podawane doustnie przez dłuższy czas mogą wywołać nudności, wymioty, otępienie, kurcze i drażnienie mięśni. Jako że może ona wchodzić w interakcje z przyjmowanymi lekami, warto zasięgnąć porady specjalisty przed rozpoczęciem suplementacji.','','Nadmierna potliwość, stany zapalne i nieżytowe w przewodzie pokarmowym. Pomocniczo w mieszankach przeciwcukrzycowych. Zewnętrznie w stanach zapalnych jamy ustnej i gardła.','Duże dawki wyciągu podawane doustnie przez dłuższy czas mogą wołać wymioty, otępienie, a nawet skurcze kloniczne. Jest to związane z obecnością tujonu w olejku eterycznym.'),(7,'Liść melisy','Jasnotowate (wargowe)','Melisa','Melisa lekarska ','Liść','Olejek eteryczny około 0,1% zawierający cytral, cytronelal, geraniol, kariofilen, linalol. Oprócz tego surowiec zawiera garbniki, kwasy trójterpenowe i kwasy aromatyczne jak kwasy kawowy, protokatechinowy i rozmarynowy.','Surowcem są liście i ulistnione szczyty pędów zebrane przed kwitnieniem rośliny. Surowiec musi zawierać nie mniej niż 1%, kwasu rozmarynowego. Liście suszy się w temperaturze nie wyższej niż 35 stopni C.\r\nJest to popularna roślina wieloletnia. Dorasta do ok. pół metra wysokości i bez trudu odnajdziemy ją zarówno na stanowiskach półcienistych, jak i nasłonecznionych. Często rośnie w przydomowych ogródkach. Dziko występuję w niemal całej Europie Środkowej, na północy Afryki, na Kaukazie, a także na zachodnich terenach Azji. Ze względu na jej szerokie zastosowanie w przemyśle farmaceutycznym i kosmetycznym, uprawiana obecnie jest w zasadzie na całym świecie.\r\nW porze kwitnienia, przypadającej w lecie, wyrastają z niej drobne białe kwiaty, które wydzielają cytrusowy zapach. Jest rośliną miododajną, stąd zapewne jedna z jej ludowych nazw – pszczelnik.        ','Surowiec jest cennym lekiem uspokajającym, stosowanym przy bezsenności.\r\nSubstancje zawarte w olejku eterycznym zmieszają wrażliwość ośrodkowego układu nerwowego. Działanie uspokajające jest na tyle silne, że pozwala na zmniejszenie dawek lub całkowite odstawienie syntetycznych środków uspokajających. Liście melisy stosowane są także w zaburzeniach trawienia - działą przeciwskurczowo i zwiększą wydzielanie soków trawiennych. Surowiec ma również działanie przeciwwirusowe i przeciwbakteryjne.','W przekazach, które znajdują się w starszych księgach zielarskich, odnajdziemy informację, że ziele melisy lekarskiej uznawano za niezwykle przyjazne dla ludzkiego układu nerwowego. Uważano, że ma ona właściwości sprzyjające uspokojeniu i wyciszeniu skołatanych nerwów. Już starożytni Grecy i Rzymianie polecali picie naparów z melisy, aby pobudzić pamięć i koncentrację, a dodatkowo sięgano po nią w przypadku potrzeby wsparcia organizmu w trakcie problemów trawiennych.                                                                                                                  \r\nNiektóre źródła podają, że wykorzystywano również świeże liście melisy lekarskiej – okładano nimi rany lub miejsca ukąszeń przez owady. Wierzono, że melisa ma właściwości antyseptyczne i przyspiesza gojenie. W tradycyjnym ziołolecznictwie odnajdziemy informacje o tym, że ważne jest stosowanie ciętego ziela melisy lekarskiej - gdy jest ono zmielone zbyt drobno, może nie wykazywać swoich pełnych właściwości. Dziś, z przeprowadzonych badań, wiemy, że proces mielenia liści zmniejsza zawartość cennych olejków eterycznych, w które tak bogata jest melisa.     ','Ostrożność w stosowaniu melisy należy zachować w trakcie ciąży i karmienia piersią.','Rojownik, cytrynowe ziele, pszczelnik','Stany ogólnego pobudzenia i niepokoju, trudności w zasypianiu. W zaburzeniach trawiennych i mało nasilonych nieżytach żołądka.',''),(8,'Ziele krwawnika','Astrowate (złożone)','Krwawnik','Krwawnik pospolity','Ziele','Główne substancje czynne zawarte są w olejku: chamazulen, pinen, tujon, borneol, cholina, kariofylen. Surowiec zawiera także proazuleny (achillina) i substancje gorzkie (germakranolidy), flawonidy i garbniki oraz kwasy i sole mineralne (przede wszystkim cynku i miedzi).','Surowcem są wysuszone, kwitnące wierzchołki pędów krwawnika pospolitego. Ziele musi zawierać nie mniej niż 2 ml/kg olejku eterycznego i 0,02% proazulenów w przeliczeniu na chamazulen.\r\nZiele zbiera się w porze kwitnienia i suszy w temperaturze nie przekraczającej 35 st. C.\r\nKrwawnik pospolity to gatunek zbiorowy. Występuje w Europie i Azji zachodniej w strefie klimatu umiarkowanego. W Polsce powszechny. Surowiec pochodzi ze stanowisk naturalnych.','Surowiec może być stosowany w zaburzeniach żołądkowo-jelitowych. Zawarte w surowcu gorycze pobudzają łaknienie i zwiększają wydzielanie soku żołądkowego. Wzrasta produkcja żółci. Obserwuje się też działanie rozkurczowe na mięśnie gładkie - dlatego preparaty z surowca powodują zmniejszenie bólu spowodowanego skurczem jelit czy narządów miednicy mniejszej. Wyciągi z krwawnika mają również działanie wiatropędne. Chamazulen obecny w olejku warunkuje działanie przeciwzapalne krwawnika. Dzięki zawartości garbników obserwuje się pewne działanie przeciwkrwotoczne - surowiec hamuje drobne krwawienia z uszkodzonych naczyń włosowatych np. w błonie śluzowej przewodu pokarmowego.','Krwawnik jest rośliną znaną medycynie naturalnej od wieków. Właściwości ziela krwawnika wykorzystywane były już w czasach starożytnych, przede wszystkim jako środek pomagający w prawidłowym funkcjonowaniu układu pokarmowego. Może przyczynić się do poprawienia apetytu, łagodzenia wzdęć, korzystnie wpływa na perystaltykę jelit. Napar z krwawnika stosowany jest również pomocowo w hamowaniu krwawień i przemywania ran, aby przyspieszyć ich gojenie.\r\nKrwawnik jest rośliną, którą od stuleci panie wykorzystują, aby dbać o swoją urodę (łagodzi podrażnienia i stany zapalne skóry, pozytywnie wpływa na stan skóry, działa odżywczo na włosy i stymuluje ich porost). Wybierany jest również przez panie jako pomoc przy zbyt obfitych miesiączkach i bólach menstruacyjnych.','Nie zaleca się stosowania krwawnika u kobiet w ciąży lub karmiących piersią. Osoby uczulone na rośliny z rodziny astrowatych powinny również unikać krwawnika, ponieważ może powodować reakcje alergiczne.\r\n\r\nW rzadkich przypadkach krwawnik pospolity może powodować działania niepożądane, takie jak nudności, wymioty, bóle głowy lub alergie skórne. W przypadku jakichkolwiek niepokojących objawów po stosowaniu krwawnika, zawsze warto skonsultować się z lekarzem.','Tysiąclist, złocień krwawnik, żeniszek krwawnik','Krwawnik stosuje się najczęściej w zaburzeniach żołądkowo-jelitowych, w bolesnych miesiączkach i stanach skurczowych w obrębie miednicy. Zewnętrznie stosowany jest jako środek przeciwzapalny i ściągający w stanach zapalnych błon śluzowych i skóry.','Niektóre uczulone osoby reagują na surowiec i jego wyciągi wysypką.'),(9,'Kwiat bzu','Piżmaczkowate','Bez','Bez czarny','Kwiat','Podstawowymi składnikami czynnymi w kwiatach bzu są flawonoidy, glikozydy kwercetyny i kemferolu, rutyna, trójterpeny (alfa-amyryna, beta-amyryna – ok. 1%, kwas oleanolowy, kwas ursolowy), fitosterole (kampesterol, beta-sitosterol, stigmasterol), kwasy fenolowe (kwas chlorogenowy do 3% oraz kwas kawowy, kwas ferulowy i kwas p-kumarowy), olejek eteryczny (do 0,5%), jak również związki mineralne 8-9%. W kwiatach są również: garbniki, nitrylozydy (sambunigryna), pektyny, śluzy, etyloamina, izobutyloamina, kwas walerianowy, cholina, witaminy, minerały i sole potasu.','Bez czarny popularnie nazywany dzikim bzem lub bzem leczniczym to krzew, który występuje powszechnie na terenie Europy, na Bliskim Wschodzie, a także w Afryce. W Polsce jest gatunkiem pospolitym. Dorasta do 10 m wysokości, jest rozłożysty, posiada drobne, eliptyczne listki. Bardzo charakterystyczne są jego baldachowate kwiaty oraz drobne, ciemnofioletowe owoce. W porze kwitnienia krzew bzu roztacza wokół siebie charakterystyczny mocny zapach. Najczęściej spotkamy go na skraju lasów, w ogrodach i w lasach liściastych.','W przypadku chorób, którym towarzyszy gorączka, pomagają obniżyć temperaturę ciała oraz pobudza ośrodek odpowiedzialny za obniżenie temperatury ciała i wydzielanie potu, dzięki czemu organizm łatwiej pozbywa się szkodliwych toksyn. Rozrzedzają katar i inne wydzieliny zalegające w gardle i płucach, udrażniają nos i zatoki oraz pomagają w opanowaniu suchego i mokrego kaszlu. \r\n\r\nMa także właściwości moczopędne, związane z obecnością flawonoidów, dlatego zalecana jest w przypadku chorób nerek przebiegających z zatrzymaniem diurezy, w kamicy moczowej oraz w problemach z łagodnym przerostem prostaty. Redukuje obrzęki, pomagają pozbyć się opuchlizn i nadmiaru wody z organizmu, dzięki czemu ułatwia walkę z nadciśnieniem i wspiera stabilizację ciśnienia tętniczego krwi na prawidłowym poziomie zalecanym przez medycynę. Surowiec powoduje zwiększenie elastyczności ścian naczyń włosowatych i zmniejszenie ich przepuszczalności. Jest to działanie charakterystyczne dla związków z grupy witaminy P, której przedstawicielem jest występująca w surowcu rutyna. \r\n\r\nWodne wciągi z kwiatów bzu mogą być stosowane zewnętrznie do przemywania ciała u osób cierpiących na stany zapalne skóry spowodowane podrażnieniami przez czynniki zewnętrzne (mróz, chemikalia, wysoką temperaturę) i choroby o podłożu metabolicznym. Łagodzą objawy egzemy, zmniejszają zaczerwienienie i tkliwość, przyspieszają regenerację komórek i gojenie ran. Nieznacznie łagodzą świąd i wyrównują przebarwienia oraz naprężają skórę, przywracając jej równomierny koloryt przy jednoczesnym zredukowaniu widoczności zmarszczek i pozostałych oznak starzenia. \r\n\r\nZe względu na łagodne działanie wyciągi wodne z kwiatów czarnego bzu znajdują zastosowanie do przemywania okoli oczu u osób cierpiących na zapalenie spojówek, zapalenie rogówki i inne choroby gałki ocznej. Prócz właściwości antyseptycznych łagodzą podrażnienia, zmniejszają obfitość ewentualnej wydzieliny ropnej oraz zmniejszają widoczność tzw. „worków pod oczami”.','Właściwości kwiatów czarnego bzu są znane i wykorzystywane od stuleci. W tradycyjnej medycynie napar z kwiatów bzu stosowany był przede wszystkim jako środek wspomagający przy przeziębieniu i grypopodobnych stanach, a także przy problemach układu krwionośnego. Kwiatom bzu przypisywano również wzmacnianie działań układu odpornościowego. Zalecano je jako naturalny środek pomagający organizmowi uporać się z drobnoustrojami. Kwiaty bzu czarnego wykorzystywano także w przypadku układu pokarmowego – miały łagodzić zgagę i wzdęcia. Syrop z kwiatów czarnego bzu cieszy się dużą popularnością, podobnie jak sok z czarnego bzu.\r\nW dawnych przekazach odnajdziemy również informacje o tym, że napar z czarnego bzu stosowany był również zewnętrznie – do przemywania oczu przy zapaleniu spojówek, przecierano nim również cerę z problemami skórnymi (np. przy trądziku) lub stosowano wspomagająco przy infekcjach narządów płciowych.\r\nKwiaty czarnego bzu to nie tylko piękna dekoracja ogrodu, ale także cenny składnik kulinarny, który można wykorzystać w różnorodnych daniach i napojach. Ich delikatny aromat i subtelny smak dodają wyjątkowego charakteru potrawom, a przy tym dostarczają cennych związków bioaktywnych','Czarnego bzu nie powinny spożywać kobiety w ciąży i karmiące piersią oraz małe dzieci. ','Bez dziki','W przeziębieniach z podwyższoną temperaturą ciała. Przy nadciśnieniu tętniczym, kamicy moczowej oraz w problemach z łagodnym przerostem prostaty. Przyjmowanie wyciągów wodnych z kwiatów czarnego bzu zalecane jest przede wszystkim osobom cierpiącym na infekcje bakteryjne i wirusowe górnych dróg oddechowych, przeziębienie, grypę, zapalenie gardła, krtani, migdałków (anginę) i oskrzeli. Stosowana w łagodzeniu łuszczycy, atopowym zapaleniu skóry, trądziku, dermatozy, świądzie, egzemach.','W owocach czarnego bzu występuje substancja zwana sambunigryną, która może wywołać pewne dolegliwości i doprowadzić np. do zatrucia. Dlatego nie powinno się ich spożywać w stanie surowym – lepiej poddać je wcześniej obróbce termicznej.'),(10,'Ziele męczennicy','Męczennicowate','Męczennica','Męczennica cielista ','Ziele','Ziele męczennicy zawiera alkaloidy indolowe (harman, harmina, beta-karboliny) i flawonoidy, które mają one korzystny wpływ na funkcjonowanie układu nerwowego, trawiennego i krwionośnego. Zawiera także glikozyd cyjanogenny, fitosterole, sole mineralne, pasiflorynę o działaniu silnie uspokajającym.\r\n','Jej naturalnym środowiskiem występowania są tropikalne rejony Ameryki. Obecnie jednak uprawiana jest na całym świecie, głównie jako roślina dekoracyjna. Męczennica cielista jest pnączem. Najbardziej niezwykłe są jej kwiaty, które trudno opisać słowami. Warto wyszukać w atlasach botanicznych lub Internecie jak wyglądają. Przypominają małe dzieła sztuki. Mogą przybierać różne barwy - od białych, przez różowe, aż do fioletu. Składają się one z kilku warstw nachodzących na siebie - tradycyjnych płaskich płatków, drobnych pręcików, gwiaździstych słupków. \r\nCiekawa jest również etymologia samej nazwy. Męczennica to kwiat męki. Nazwę nadali jej misjonarze przybyli do Ameryki Północnej. Uważali, że kwiat symbolizuje cierpienie i śmierć Chrystusa, uznali ją za znak od Boga, który nakazywał im nawracać rdzenną ludność na chrześcijaństwo. W kwiecie męczennicy dopatrzyli się wizerunku korony cierniowej, gwoździ oraz ramion krzyża. Uważali również, że nieprzypadkowa jest liczba poszczególnych elementów (pięć płatków to pięć ran Jezusa, trójdzielne ramię to trzy gwoździe itd.) ','Jej skuteczność bywa porównywana do lupuliny zawartej w szyszkach chmielu, z którymi doskonale się komponuje i których działanie wydatnie wzmacnia. \r\nZe względu na obecność substancji silnie antagonizujących, działanie męczennicy zależy od zastosowanej dawki. W mniejszych ilościach działa uspokajająco i kojąco. Znosi wrażliwość na ból i zdecydowanie ogranicza reakcje lękowe, poprawia samopoczucie i samoocenę, zmniejsza podatność na nastroje depresyjne. Ogranicza poziom stresu, uspokaja, rozluźnia mięśnie, wykazuje wpływ lekko nasenny. Przeciwdziała kurczom i wspomaga działanie leków obniżających ciśnienie krwi. \r\nW większych dawkach działa przeciwnie - pobudza ośrodkowy system nerwowy, zmniejsza możliwość koncentracji i ogranicza zdolności poznawcze. Powoduje drgawki i skurcze mięśni, może być przyczyną wystąpienia omamów i halucynacji. Przyspiesza tętno i podwyższa ciśnienie krwi, zwiększa ogólny niepokój.','Jako pierwsi właściwości męczennicy zauważyli i stosowali Indianie Ameryki Północnej i Środkowej. Szamani stosowali passiflorę jako środek wspomagający walkę z problemami psychicznymi. Uważali, że ziele wycisza, poprawia nastrój, uspokaja i ułatwia zasypianie. Zalecali ją kobietom, aby łagodzić dolegliwości związane z cyklem menstruacyjnym.\r\nZ pomocą passiflory Indianie radzili sobie również  przy problemach trawiennych. Dziś bardzo często medycyna alternatywna wykorzystuje męczennicę pomocniczo w uzależnieniach.','Męczennica nie powinna być stosowana przez kobiety w ciąży, karmiące piersią oraz dzieci.','','Środek pomagający w uspokojeniu i łatwiejszym zasypianiu. Sprzyja zmniejszeniu poziomu odczuwanego stresu, pomaga pozbyć się uczucia strachu i napięć, łagodzi dolegliwości związane z nerwicą wegetatywną, nadpobudliwością fizyczną i ruchową, dla stępienia reakcji na bodźce środowiskowe, dojrzewaniem, ciążą i okresem menopauzalnym.\r\nDoskonale sprawdza się w kuracjach odwykowych, jako składnik preparatów uspokajających w leczeniu uzależnień od narkotyków, leków, alkoholu i papierosów. Zalecana w depresji i w chwilach przejściowego obniżenia nastroju.','Nie powinna być spożywana przez kierowców i osoby obsługujące urządzenia mechaniczne, ponieważ może powodować uczucie senności, a w dużych dawkach - silny ból głowy i zaburzenia wzroku. Harmina w dużych dawkach ma właściwości halucynogenne. Nie należy przekraczać maksymalnej dawki dziennej wynoszącej 8 g surowca.');
/*!40000 ALTER TABLE `polish_plant_description` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-03 13:58:38
