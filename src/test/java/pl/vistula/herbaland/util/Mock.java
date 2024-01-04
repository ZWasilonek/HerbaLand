package pl.vistula.herbaland.util;

import pl.vistula.herbaland.dto.AuthorizationRoleDTO;
import pl.vistula.herbaland.dto.PolishPlantDTO;
import pl.vistula.herbaland.model.AuthorizationRole;
import pl.vistula.herbaland.model.PolishPlant;

public class Mock {

  public static AuthorizationRole getRoles() {
    AuthorizationRole authorizationRole = new AuthorizationRole();
    authorizationRole.setId(1);
    authorizationRole.setName("ROLE_ADMIN");
    return authorizationRole;
  }

  public static AuthorizationRoleDTO getRolesDTO() {
    AuthorizationRoleDTO authorizationRoleDTO = new AuthorizationRoleDTO();
    authorizationRoleDTO.setId(1);
    authorizationRoleDTO.setName("ROLE_ADMIN");
    return authorizationRoleDTO;
  }

  public static PolishPlant getPolishPlant() {
    PolishPlant polishPlant = new PolishPlant();
    polishPlant.setId(1);
    polishPlant.setName("Lukrecja");
    polishPlant.setFamily("Bobowate (motylkowate)");
    polishPlant.setType("Lukrecja");
    polishPlant.setSpecies("Lukrecja gładka");
    polishPlant.setRawMaterial("Korzeń cięty");
    polishPlant.setActiveCompounds("Surowiec zawiera saponozydy trójterpenowe (glicyryzyna) i flawonoidy (izolikwirytygenina). Pozostałe składniki (kumaryny, węglowodany) mają marginalne znaczenie.");
    polishPlant.setPlantDescription("Lukrecja występuje w Europie i Azji. Dorasta do mniej więcej półtora metra wysokości, ma skórzaste liście, a gdy kwitnie, pojawiają się na niej białe, fioletowe lub niebieskie kwiaty. Surowcem są wysuszone, całe lub rozdrobnione, podziemne częci wymienionych wyżej gatunków lukrecji zawierające nie mniej niż 4% kwasu glicyryzynowego.Surowiec pozyskuje się z kilkuletnich roślin w okresie późnej jesieni lub wczesną wiosną. Suszenie surowca przebiega w temperaturze do 35 st. C");
    polishPlant.setProperties("Obecność związków saponinowych sprawia, że surowiec ma działanie wykrztuśne i sekretolityczne. Wyciągi z lukrecji wykazują również działanie przeciwzapalne na błony śluzowe przewodu pokarmowego. Od dawna stosowana w leczeniu choroby wrzodowej. Saponiny nasilają też działanie antrazwiązków - dlatego korzeń lukrecji stanowi dodatek do niektórych preparatów o działaniu przeczyszczającym. Zawarta w lukrecji izolikwirytygenina zmniejsza napięcie mięśni gładkich w obrębie żołądka, jelit, oskrzeli, dróg żółciowych i, słabiej, moczowych. Badania in vitro wskazują na aktywność przeciwwirusową wodnych wyciągów z lukrecji. Wykazano również, że podawanie dużych dawek zawartej w surowcu glicyryzyny ma działanie hepatoprotekcyjne. Lukrecja ma słodki smak i w małych ilościach może być stosowana do słodzenia potraw.");
    polishPlant.setTraditionalUse("Wewnętrznie w mokrym kaszlu jako środek wykrztuśny, w chorobie wrzodowej i nieżycie żołądka - jako lek o działaniu przeciwzapalnym. Zewnętrznie na skórę - jako preparat przeciwzapalny.");
    polishPlant.setContraindications("Lukrecji nie należy podawać dzieciom poniżej 4 roku życia, kobietom w ciąży i karmiącym piersią.");
    polishPlant.setSynonyms("Słodzień, słodkie drzewo, słodki korzeń, Licorice Root, Lukrecja chińska");
    return polishPlant;
  }

  public static PolishPlantDTO getPolishPlantDTO() {
    PolishPlantDTO polishPlantDTO = new PolishPlantDTO();
    polishPlantDTO.setId(1);
    polishPlantDTO.setName("Lukrecja");
    polishPlantDTO.setFamily("Bobowate (motylkowate)");
    polishPlantDTO.setType("Lukrecja");
    polishPlantDTO.setSpecies("Lukrecja gładka");
    polishPlantDTO.setRawMaterial("Korzeń cięty");
    polishPlantDTO.setActiveCompounds("Surowiec zawiera saponozydy trójterpenowe (glicyryzyna) i flawonoidy (izolikwirytygenina). Pozostałe składniki (kumaryny, węglowodany) mają marginalne znaczenie.");
    polishPlantDTO.setPlantDescription("Lukrecja występuje w Europie i Azji. Dorasta do mniej więcej półtora metra wysokości, ma skórzaste liście, a gdy kwitnie, pojawiają się na niej białe, fioletowe lub niebieskie kwiaty. Surowcem są wysuszone, całe lub rozdrobnione, podziemne częci wymienionych wyżej gatunków lukrecji zawierające nie mniej niż 4% kwasu glicyryzynowego.Surowiec pozyskuje się z kilkuletnich roślin w okresie późnej jesieni lub wczesną wiosną. Suszenie surowca przebiega w temperaturze do 35 st. C");
    polishPlantDTO.setProperties("Obecność związków saponinowych sprawia, że surowiec ma działanie wykrztuśne i sekretolityczne. Wyciągi z lukrecji wykazują również działanie przeciwzapalne na błony śluzowe przewodu pokarmowego. Od dawna stosowana w leczeniu choroby wrzodowej. Saponiny nasilają też działanie antrazwiązków - dlatego korzeń lukrecji stanowi dodatek do niektórych preparatów o działaniu przeczyszczającym. Zawarta w lukrecji izolikwirytygenina zmniejsza napięcie mięśni gładkich w obrębie żołądka, jelit, oskrzeli, dróg żółciowych i, słabiej, moczowych. Badania in vitro wskazują na aktywność przeciwwirusową wodnych wyciągów z lukrecji. Wykazano również, że podawanie dużych dawek zawartej w surowcu glicyryzyny ma działanie hepatoprotekcyjne. Lukrecja ma słodki smak i w małych ilościach może być stosowana do słodzenia potraw.");
    polishPlantDTO.setTraditionalUse("Wewnętrznie w mokrym kaszlu jako środek wykrztuśny, w chorobie wrzodowej i nieżycie żołądka - jako lek o działaniu przeciwzapalnym. Zewnętrznie na skórę - jako preparat przeciwzapalny.");
    polishPlantDTO.setContraindications("Lukrecji nie należy podawać dzieciom poniżej 4 roku życia, kobietom w ciąży i karmiącym piersią.");
    polishPlantDTO.setSynonyms("Słodzień, słodkie drzewo, słodki korzeń, Licorice Root, Lukrecja chińska");
    return polishPlantDTO;
  }

}