# encoding: UTF-8
module EasyTimeZone

  def in(city)
    time_zone = city_zone[city.downcase.to_sym]
    fail "Unknown city" if time_zone.nil?
    operator_offset = zone_offset[time_zone.to_sym]
    
    add_or_subtract_time self.utc, operator_offset
  end


  private
  def add_or_subtract_time time, operator_offset
    return time if operator_offset == []

    if operator_offset.first == "+"
      converted_time = time + convert_hours_minutes_to_seconds(operator_offset[1])
    else
      converted_time = time - convert_hours_minutes_to_seconds(operator_offset[1])
    end
    converted_time
  end

  def convert_hours_minutes_to_seconds time_string
    time_in_seconds = 0
    hours_minutes = time_string.split(":")
    time_in_seconds += hours_minutes.first.to_i * 3600
    time_in_seconds += hours_minutes[1].to_i * 60 unless hours_minutes[1].nil?
    time_in_seconds
  end

  def city_zone
    {:kabul=>"AFT", :kandahar=>"AFT", :anchorage=>"AKST", :fairbanks=>"AKST", :juneau=>"AKST", :nome=>"AKST", :unalaska=>"AKST", :almaty=>"ALMT", :astana=>"ALMT", :"boa vista"=>"AMT", :manaus=>"AMT", :"porto velho"=>"AMT", :"rio branco"=>"AMT", :yerevan=>"AMT", :anadyr=>"ANAT", :aktau=>"AQTT", :aqtobe=>"AQTT", :"buenos aires"=>"ART", :córdoba=>"CET", :"la plata"=>"ART", :"mar del plata"=>"ART", :mendoza=>"ART", :neuquén=>"ART", :rosario=>"ART", :salta=>"ART", :"santa fe"=>"MST", :tucumán=>"ART", :"basse-terre (guadeloupe)"=>"AST", :"basseterre (st. kitts)"=>"AST", :"blanc-sablon"=>"AST", :brades=>"AST", :bridgetown=>"AST", :castries=>"AST", :"charlotte amalie"=>"AST", :charlottetown=>"AST", :christiansted=>"AST", :"fort-de-france"=>"AST", :halifax=>"AST", :"hamilton (bermuda)"=>"AST", :"happy valley-goose bay"=>"AST", :kingstown=>"AST", :"road town"=>"AST", :roseau=>"AST", :"saint george's"=>"AST", :"saint john (ca - nb)"=>"AST", :"saint john's (antigua)"=>"AST", :"san juan"=>"AST", :"santiago de los caballeros"=>"AST", :"santo domingo"=>"AST", :"the valley"=>"AST", :willemstad=>"AST", :oranjestad=>"AST", :"port of spain"=>"AST", :aden=>"AST", :baghdad=>"AST", :basra=>"AST", :dammam=>"AST", :doha=>"AST", :hilla=>"AST", :irbil=>"AST", :jeddah=>"AST", :karbala=>"AST", :kirkuk=>"AST", :"kuwait city"=>"AST", :makkah=>"AST", :manama=>"AST", :medina=>"AST", :mosul=>"AST", :najaf=>"AST", :nasiriya=>"AST", :qatif=>"AST", :riyadh=>"AST", :sana=>"AST", :sulaimaniya=>"AST", :azores=>"AZOT", :baku=>"AZT", :stepanakert=>"AZT", :"bandar seri begawan"=>"BNT", :"la paz"=>"BOT", :"santa cruz"=>"WET", :sucre=>"BOT", :"belo horizonte dst"=>"BRST", :"brasilia dst"=>"BRST", :"campinas dst"=>"BRST", :"criciúma dst"=>"BRST", :"curitiba dst"=>"BRST", :"goiânia dst"=>"BRST", :"niterói dst"=>"BRST", :"pirassununga dst"=>"BRST", :"porto alegre dst"=>"BRST", :"rio de janeiro dst"=>"BRST", :"santos dst"=>"BRST", :"sao paulo dst"=>"BRST", :"vitória dst"=>"BRST", :"barra do garças"=>"BRT", :belém=>"BRT", :fortaleza=>"BRT", :maceió=>"BRT", :natal=>"BRT", :recife=>"BRT", :salvador=>"BRT", :santarém=>"BRT", :barisal=>"BST", :chandpur=>"BST", :chittagong=>"BST", :comilla=>"BST", :dhaka=>"BST", :jessore=>"BST", :khulna=>"BST", :mymensingh=>"BST", :pabna=>"BST", :saidpur=>"BST", :sylhet=>"BST", :thimphu=>"BTT", :blantyre=>"CAT", :bujumbura=>"CAT", :bulawayo=>"CAT", :gaborone=>"CAT", :harare=>"CAT", :kigali=>"CAT", :lilongwe=>"CAT", :lubumbashi=>"CAT", :lusaka=>"CAT", :maputo=>"CAT", :mutare=>"CAT", :bantam=>"CCT", :"adelaide dst"=>"CDT", :algiers=>"CET", :tunis=>"CET", :"a coruña"=>"CET", :aachen=>"CET", :aalen=>"CET", :aarau=>"CET", :Ålesund=>"CET", :alicante=>"CET", :almería=>"CET", :altdorf=>"CET", :amsterdam=>"CET", :"andorra la vella"=>"CET", :appenzell=>"CET", :arnsberg=>"CET", :aschaffenburg=>"CET", :augsburg=>"CET", :"baden-baden"=>"CET", :"banja luka"=>"CET", :barcelona=>"CET", :basel=>"CET", :bastia=>"CET", :bayreuth=>"CET", :belgrade=>"CET", :bellinzona=>"CET", :bergheim=>"CET", :"bergisch gladbach"=>"CET", :berlin=>"CET", :bern=>"CET", :biel=>"CET", :bielefeld=>"CET", :bocholt=>"CET", :bochum=>"CET", :bologna=>"CET", :bolzano=>"CET", :bonn=>"CET", :bordeaux=>"CET", :bottrop=>"CET", :bratislava=>"CET", :braunschweig=>"CET", :bregenz=>"CET", :bremen=>"CET", :bremerhaven=>"CET", :brno=>"CET", :"bruck an der leitha"=>"CET", :brussels=>"CET", :budapest=>"CET", :cadiz=>"CET", :cagliari=>"CET", :"castrop-rauxel"=>"CET", :celle=>"CET", :ceuta=>"CET", :chemnitz=>"CET", :chur=>"CET", :cologne=>"CET", :copenhagen=>"CET", :cottbus=>"CET", :cuxhaven=>"CET", :darmstadt=>"CET", :debrecen=>"CET", :delémont=>"CET", :delmenhorst=>"CET", :"dessau-rosslau"=>"CET", :detmold=>"CET", :deutschlandsberg=>"CET", :dinslaken=>"CET", :dormagen=>"CET", :dorsten=>"CET", :dortmund=>"CET", :drammen=>"CET", :duisburg=>"CET", :düren=>"CET", :düsseldorf=>"CET", :eferding=>"CET", :eisenstadt=>"CET", :emden=>"CET", :erfurt=>"CET", :erlangen=>"CET", :essen=>"CET", :esslingen=>"CET", :euskirchen=>"CET", :feldbach=>"CET", :flensburg=>"CET", :frankfurt=>"CET", :frauenfeld=>"CET", :freiburg=>"CET", :freising=>"CET", :freistadt=>"CET", :fribourg=>"CET", :friedrichshafen=>"CET", :fulda=>"CET", :fürstenfeld=>"CET", :fürth=>"CET", :garbsen=>"CET", :gdansk=>"CET", :gelsenkirchen=>"CET", :geneva=>"CET", :genoa=>"CET", :gera=>"CET", :gibraltar=>"CET", :giessen=>"CET", :gladbeck=>"CET", :glarus=>"CET", :gmünd=>"CET", :göppingen=>"CET", :görlitz=>"CET", :göttingen=>"CET", :granada=>"CET", :graz=>"CET", :greifswald=>"CET", :grevenbroich=>"CET", :grieskirchen=>"CET", :gütersloh=>"CET", :hagen=>"CET", :halle=>"CET", :hamburg=>"CET", :hameln=>"CET", :hamm=>"CET", :hammerfest=>"CET", :hanau=>"CET", :hannover=>"CET", :haugesund=>"CET", :heidelberg=>"CET", :heilbronn=>"CET", :herford=>"CET", :herisau=>"CET", :herne=>"CET", :herten=>"CET", :hildesheim=>"CET", :hürth=>"CET", :ingolstadt=>"CET", :innsbruck=>"CET", :iserlohn=>"CET", :jena=>"CET", :kaiserslautern=>"CET", :kassel=>"CET", :kempten=>"CET", :kerpen=>"CET", :kiel=>"CET", :klagenfurt=>"CET", :koblenz=>"CET", :köniz=>"CET", :konstanz=>"CET", :košice=>"CET", :kraków=>"CET", :krefeld=>"CET", :"langenfeld (rheinland)"=>"CET", :larvik=>"CET", :lausanne=>"CET", :leipzig=>"CET", :leverkusen=>"CET", :liestal=>"CET", :linz=>"CET", :lippstadt=>"CET", :ljubljana=>"CET", :lódz=>"CET", :longyearbyen=>"CET", :lübeck=>"CET", :lucerne=>"CET", :lüdenscheid=>"CET", :ludwigsburg=>"CET", :ludwigshafen=>"CET", :lugano=>"CET", :lünen=>"CET", :luxembourg=>"CET", :madrid=>"CET", :magdeburg=>"CET", :mainz=>"CET", :mannheim=>"CET", :marburg=>"CET", :marl=>"CET", :marseille=>"CET", :melilla=>"CET", :milan=>"CET", :minden=>"CET", :miskolc=>"CET", :modena=>"CET", :moers=>"CET", :monaco=>"CET", :mönchengladbach=>"CET", :montreux=>"CET", :monza=>"CET", :mostar=>"CET", :mülheim=>"CET", :"mülheim / ruhr"=>"CET", :munich=>"CET", :münster=>"CET", :naples=>"EST", :neubrandenburg=>"CET", :neuchâtel=>"CET", :neumünster=>"CET", :neuss=>"CET", :"neustadt an der weinstraße"=>"CET", :neuwied=>"CET", :nice=>"CET", :norderstedt=>"CET", :nordhorn=>"CET", :nuremberg=>"CET", :oberhausen=>"CET", :offenbach=>"CET", :offenburg=>"CET", :oldenburg=>"CET", :osijek=>"CET", :oslo=>"CET", :osnabrück=>"CET", :ostrava=>"CET", :paderborn=>"CET", :palermo=>"CET", :"palma (es-majorca)"=>"CET", :paris=>"CET", :passau=>"CET", :pforzheim=>"CET", :plauen=>"CET", :plzen=>"CET", :podgorica=>"CET", :potsdam=>"CET", :poznan=>"CET", :prague=>"CET", :pristina=>"CET", :ratingen=>"CET", :ravensburg=>"CET", :recklinghausen=>"CET", :regensburg=>"CET", :reutlingen=>"CET", :rheine=>"CET", :rome=>"CET", :rosenheim=>"CET", :rostock=>"CET", :rotterdam=>"CET", :saarbrücken=>"CET", :salzburg=>"CET", :salzgitter=>"CET", :"san marino"=>"CET", :sandefjord=>"CET", :sandvika=>"CET", :sarajevo=>"CET", :sarnen=>"CET", :sassari=>"CET", :schaffhausen=>"CET", :"schwäbisch gmünd"=>"CET", :schweinfurt=>"CET", :schwerin=>"CET", :schwyz=>"CET", :siegen=>"CET", :sindelfingen=>"CET", :sion=>"CET", :skopje=>"CET", :solingen=>"CET", :solothurn=>"CET", :speyer=>"CET", :split=>"CET", :"st. gallen"=>"CET", :"st. pölten"=>"CET", :stans=>"CET", :stockholm=>"CET", :"stolberg (rheinland)"=>"CET", :stralsund=>"CET", :strasbourg=>"CET", :stuttgart=>"CET", :szczecin=>"CET", :szeged=>"CET", :tirana=>"CET", :trier=>"CET", :trieste=>"CET", :troisdorf=>"CET", :tübingen=>"CET", :turin=>"CET", :ulm=>"CET", :unna=>"CET", :uster=>"CET", :vaduz=>"CET", :valletta=>"CET", :"vatican city"=>"CET", :velbert=>"CET", :venice=>"CET", :verona=>"CET", :vienna=>"CET", :viersen=>"CET", :villach=>"CET", :warsaw=>"CET", :weimar=>"CET", :wesel=>"CET", :wiesbaden=>"CET", :winterthur=>"CET", :wismar=>"CET", :witten=>"CET", :wolfsburg=>"CET", :worms=>"CET", :wroclaw=>"CET", :wuppertal=>"CET", :würzburg=>"CET", :zagreb=>"CET", :zug=>"CET", :zürich=>"CET", :zwickau=>"CET", :"chatham islands dst"=>"CHADT", :choibalsan=>"CHOT", :"guam (hagåtña)"=>"ChST", :saipan=>"ChST", :rarotonga=>"CKT", :"punta arenas dst"=>"CLST", :"santiago dst"=>"CLST", :"valparaíso dst"=>"CLST", :barranquilla=>"COT", :bogota=>"COT", :bucaramanga=>"COT", :cali=>"COT", :cartagena=>"COT", :cúcuta=>"COT", :manizales=>"COT", :medellin=>"COT", :pereira=>"COT", :villavicencio=>"COT", :abilene=>"CST", :acapulco=>"CST", :aguascalientes=>"CST", :amarillo=>"CST", :arlington=>"CST", :austin=>"CST", :"baker lake"=>"CST", :"baton rouge"=>"CST", :beaumont=>"CST", :"belize city"=>"CST", :belmopan=>"CST", :birmingham=>"GMT", :bismarck=>"CST", :"bryan – college station"=>"CST", :cancún=>"CST", :"cedar rapids"=>"CST", :chetumal=>"CST", :chicago=>"CST", :clarksville=>"CST", :colima=>"CST", :dallas=>"CST", :decatur=>"CST", :"des moines"=>"CST", :evansville=>"CST", :fargo=>"CST", :"fort smith"=>"CST", :"fort worth"=>"CST", :fresnillo=>"CST", :garland=>"CST", :gary=>"CST", :guadalajara=>"CST", :guatemala=>"CST", :havana=>"CST", :holguín=>"CST", :houston=>"CST", :huntsville=>"CST", :independence=>"CST", :irving=>"CST", :jackson=>"CST", :"jefferson city"=>"CST", :"kansas city"=>"CST", :"la ceiba"=>"CST", :laredo=>"CST", :leon=>"CST", :lincoln=>"CST", :"little rock"=>"CST", :madison=>"CST", :managua=>"CST", :matamoros=>"CST", :memphis=>"CST", :merida=>"CST", :mesquite=>"CST", :metairie=>"CST", :"mexico city"=>"CST", :midland=>"CST", :milwaukee=>"CST", :minneapolis=>"CST", :mobile=>"CST", :monterrey=>"CST", :montgomery=>"CST", :nashville=>"CST", :"new orleans"=>"CST", :oaxaca=>"CST", :"oklahoma city"=>"CST", :olathe=>"CST", :"overland park"=>"CST", :owensboro=>"CST", :"pasadena (usa-tx)"=>"CST", :pensacola=>"CST", :peoria=>"CST", :pierre=>"CST", :plano=>"CST", :"playa del carmen"=>"CST", :"puerto vallarta"=>"CST", :regina=>"CST", :resolute=>"CST", :rockford=>"CST", :"san antonio"=>"CST", :"san jose (cr)"=>"CST", :"san luis potosi"=>"CST", :"san salvador"=>"CST", :"santa ana"=>"CST", :"santiago de cuba"=>"CST", :saskatoon=>"CST", :shreveport=>"CST", :"sioux falls"=>"CST", :"springfield (mo)"=>"CST", :"springfield (il)"=>"CST", :"st. louis"=>"CST", :"st. paul"=>"CST", :tegucigalpa=>"CST", :topeka=>"CST", :"tuxtla gutierrez"=>"CST", :veracruz=>"CST", :waco=>"CST", :wichita=>"CST", :winnipeg=>"CST", :anshan=>"CST", :baoding=>"CST", :baotou=>"CST", :beijing=>"CST", :benxi=>"CST", :changchun=>"CST", :changsha=>"CST", :chengdu=>"CST", :chongqing=>"CST", :dalian=>"CST", :datong=>"CST", :foochow=>"CST", :foshan=>"CST", :fushun=>"CST", :guangzhou=>"CST", :guilin=>"CST", :guiyang=>"CST", :haikou=>"CST", :handan=>"CST", :hangzhou=>"CST", :harbin=>"CST", :hefei=>"CST", :hohhot=>"CST", :huaibei=>"CST", :huainan=>"CST", :jilin=>"CST", :jinan=>"CST", :jinzhou=>"CST", :kaohsiung=>"CST", :kashgar=>"CST", :kunming=>"CST", :lanchow=>"CST", :lanzhou=>"CST", :lhasa=>"CST", :luoyang=>"CST", :macau=>"CST", :nanchang=>"CST", :nanjing=>"CST", :nanning=>"CST", :qiqihar=>"CST", :shanghai=>"CST", :shantou=>"CST", :shenyang=>"CST", :shenzhen=>"CST", :shijiazhuang=>"CST", :sian=>"CST", :suzhou=>"CST", :taichung=>"CST", :taipei=>"CST", :taiyuan=>"CST", :tangshan=>"CST", :tianjin=>"CST", :tsingtao=>"CST", :Ürümqi=>"CST", :wuhan=>"CST", :xiamen=>"CST", :xining=>"CST", :xinyang=>"CST", :xuzhou=>"CST", :yinchuan=>"CST", :zhengzhou=>"CST", :zibo=>"CST", :"alice springs"=>"CST", :darwin=>"CST", :benghazi=>"CT", :kufra=>"CT", :misrata=>"CT", :sabha=>"CT", :tripoli=>"CT", :praia=>"CVT", :eucla=>"CWST", :"the settlement"=>"CXT", :"easter island dst"=>"EASST", :"addis ababa"=>"EAT", :antananarivo=>"EAT", :arusha=>"EAT", :asmara=>"EAT", :"dar es salaam"=>"EAT", :"dire dawa"=>"EAT", :djibouti=>"EAT", :dodoma=>"EAT", :entebbe=>"EAT", :hargeisa=>"EAT", :juba=>"EAT", :kampala=>"EAT", :khartoum=>"EAT", :mamoutzou=>"EAT", :mogadishu=>"EAT", :mombasa=>"EAT", :moroni=>"EAT", :nairobi=>"EAT", :"zanzibar city"=>"EAT", :guayaquil=>"ECT", :quito=>"ECT", :"canberra dst"=>"EDT", :"hobart dst"=>"EDT", :"melbourne dst"=>"EDT", :"sydney dst"=>"EDT", :"traralgon dst"=>"EDT", :"wollongong dst"=>"EDT", :"amman dst"=>"EEST", :"al jizah"=>"EET", :alexandria=>"EST", :cairo=>"EET", :hurghada=>"EET", :aleppo=>"EET", :ankara=>"EET", :antalya=>"EET", :beirut=>"EET", :bethlehem=>"EET", :bodrum=>"EET", :damascus=>"EET", :daraa=>"EET", :gaza=>"EET", :hebron=>"EET", :homs=>"EET", :izmir=>"EET", :kayseri=>"EET", :mersin=>"EET", :nablus=>"EET", :nicosia=>"EET", :athens=>"EST", :brăila=>"EET", :bucharest=>"EET", :burgas=>"EET", :bursa=>"EET", :chisinau=>"EET", :"cluj-napoca"=>"EET", :helsinki=>"EET", :iasi=>"EET", :ioannina=>"EET", :istanbul=>"EET", :kaunas=>"EET", :kharkiv=>"EET", :khmelnytskyi=>"EET", :"kryvyi rih"=>"EET", :kyiv=>"EET", :luhansk=>"EET", :odesa=>"EET", :riga=>"EET", :rovaniemi=>"EET", :samsun=>"EET", :sofia=>"EET", :tallinn=>"EET", :"târgu mureş"=>"EET", :tartu=>"EET", :timișoara=>"EET", :tiraspol=>"EET", :uzhgorod=>"EET", :varna=>"EET", :vilnius=>"EET", :zaporizhia=>"EET", :akron=>"EST", :albany=>"EST", :allentown=>"EST", :"ann arbor"=>"EST", :annapolis=>"EST", :atlanta=>"EST", :"augusta (us-ga)"=>"EST", :"augusta (us-me)"=>"EST", :baltimore=>"EST", :barrie=>"EST", :boston=>"EST", :brampton=>"EST", :bridgeport=>"EST", :buffalo=>"EST", :burlington=>"EST", :cambridge=>"EST", :"cap-haïtien"=>"EST", :"cape coral"=>"EST", :"charleston (wv)"=>"EST", :"charleston (sc)"=>"EST", :charlotte=>"EST", :"chatham-kent"=>"EST", :chattanooga=>"EST", :chesapeake=>"EST", :chibougamau=>"EST", :cincinnati=>"EST", :cleveland=>"EST", :"cockburn town"=>"EST", :columbia=>"EST", :"columbus (usa)"=>"EST", :concord=>"EST", :dayton=>"EST", :detroit=>"EST", :dover=>"EST", :elizabeth=>"EST", :erie=>"EST", :fayetteville=>"EST", :flint=>"EST", :"fort lauderdale"=>"EST", :"fort wayne"=>"EST", :frankfort=>"EST", :gainesville=>"EST", :gatineau=>"EST", :"george town"=>"MYT", :"grand rapids"=>"EST", :"greater sudbury"=>"EST", :guelph=>"EST", :"hamilton (ca-on)"=>"EST", :hampton=>"EST", :harrisburg=>"EST", :hartford=>"EST", :hialeah=>"EST", :hollywood=>"PST", :indianapolis=>"EST", :iqaluit=>"EST", :jacksonville=>"EST", :"jersey city"=>"EST", :"key west"=>"EST", :"kingston (canada)"=>"EST", :"kingston (jm)"=>"EST", :kitchener=>"EST", :knoxville=>"EST", :lansing=>"EST", :laval=>"EST", :"lexington-fayette"=>"EST", :livonia=>"EST", :london=>"GMT", :longueuil=>"EST", :louisville=>"EST", :lowell=>"EST", :lynchburg=>"EST", :macon=>"EST", :markham=>"EST", :miami=>"EST", :mississauga=>"EST", :montpelier=>"EST", :montreal=>"EST", :nassau=>"EST", :"new haven"=>"EST", :"new york"=>"EST", :newark=>"EST", :"newport news"=>"EST", :norfolk=>"EST", :oakville=>"EST", :orlando=>"EST", :oshawa=>"EST", :ottawa=>"EST", :panama=>"EST", :paterson=>"EST", :philadelphia=>"EST", :pittsburgh=>"EST", :"pond inlet"=>"EST", :"port-au-prince"=>"EST", :"portland (maine)"=>"EST", :portsmouth=>"EST", :providence=>"EST", :québec=>"EST", :raleigh=>"EST", :"richmond (us-va)"=>"EST", :"richmond hill"=>"EST", :rochester=>"EST", :saguenay=>"EST", :sherbrooke=>"EST", :"south bend"=>"EST", :"springfield (ma)"=>"EST", :"st. catharines"=>"EST", :"st. petersburg"=>"EST", :stamford=>"EST", :"sterling heights"=>"EST", :syracuse=>"EST", :tallahassee=>"EST", :tampa=>"EST", :"thunder bay"=>"EST", :toledo=>"EST", :toronto=>"EST", :trenton=>"EST", :"trois-rivieres"=>"EST", :"virginia beach"=>"EST", :warren=>"EST", :"washington dc"=>"EST", :waterbury=>"EST", :windsor=>"EST", :"winston-salem"=>"EST", :worcester=>"EST", :yonkers=>"EST", :brisbane=>"EST", :cairns=>"EST", :kaliningrad=>"FET", :minsk=>"FET", :"suva dst"=>"FJST", :"stanley dst"=>"FKST", :"fernando de noronha"=>"FNT", :"galapagos islands"=>"GALT", :"gambier islands"=>"GAMT", :tbilisi=>"GET", :cayenne=>"GFT", :tarawa=>"GILT", :abidjan=>"GMT", :accra=>"GMT", :bamako=>"GMT", :banjul=>"GMT", :bissau=>"GMT", :conakry=>"GMT", :dakar=>"GMT", :freetown=>"GMT", :jamestown=>"GMT", :lome=>"GMT", :monrovia=>"GMT", :nouakchott=>"GMT", :ouagadougou=>"GMT", :"são tomé"=>"GMT", :yamoussoukro=>"GMT", :belfast=>"GMT", :cardiff=>"GMT", :cheltenham=>"GMT", :cork=>"GMT", :douglas=>"GMT", :dublin=>"GMT", :edinburgh=>"GMT", :galway=>"GMT", :glasgow=>"GMT", :limerick=>"GMT", :liverpool=>"GMT", :londonderry=>"GMT", :plymouth=>"GMT", :reykjavik=>"GMT", :"saint helier"=>"GMT", :"st. peter port"=>"GMT", :waterford=>"GMT", :"abu dhabi"=>"GST", :dubai=>"GST", :muscat=>"GST", :nizwa=>"GST", :sharjah=>"GST", :georgetown=>"GYT", :adak=>"HAST", :hilo=>"HAST", :honolulu=>"HAST", :wailuku=>"HAST", :"hong kong"=>"HKT", :kowloon=>"HKT", :hovd=>"HOVT", :bangkok=>"ICT", :"chiang mai"=>"ICT", :"hai phong"=>"ICT", :hanoi=>"ICT", :"ho chi minh"=>"ICT", :"khon kaen"=>"ICT", :pattaya=>"ICT", :"phnom penh"=>"ICT", :phuket=>"ICT", :vientiane=>"ICT", :irkutsk=>"IRKT", :"ulan-ude"=>"IRKT", :"bandar-abbas"=>"IRST", :bushehr=>"IRST", :esfahãn=>"IRST", :kerman=>"IRST", :mahabad=>"IRST", :mashhad=>"IRST", :rasht=>"IRST", :sanandaj=>"IRST", :sari=>"IRST", :shiraz=>"IRST", :tabriz=>"IRST", :tehran=>"IRST", :urmia=>"IRST", :agra=>"IST", :ahmedabad=>"IST", :ahmednagar=>"IST", :akola=>"IST", :allahabad=>"IST", :anantapur=>"IST", :asansol=>"IST", :aurangabad=>"IST", :bangalore=>"IST", :bhopal=>"IST", :bhubaneshwar=>"IST", :bijapur=>"IST", :chennai=>"IST", :cherrapunji=>"IST", :coimbatore=>"IST", :colombo=>"IST", :damoh=>"IST", :delhi=>"IST", :dharamshala=>"IST", :durgapur=>"IST", :ghaziabad=>"IST", :gorakhpur=>"IST", :hissar=>"IST", :howrah=>"IST", :hubli=>"IST", :hyderãbãd=>"IST", :indore=>"IST", :jabalpur=>"IST", :jaipur=>"IST", :jalandhar=>"IST", :jerusalem=>"IST", :kãnpur=>"IST", :kochi=>"IST", :kolkata=>"IST", :lucknow=>"IST", :ludhiana=>"IST", :madurai=>"IST", :mangalore=>"IST", :meerut=>"IST", :mumbai=>"IST", :nãgpur=>"IST", :nalbari=>"IST", :nashik=>"IST", :"new delhi"=>"IST", :patna=>"IST", :"port blair"=>"IST", :pune=>"IST", :shillong=>"IST", :shimla=>"IST", :sirsa=>"IST", :"sri jayawardenapura kotte"=>"IST", :surat=>"IST", :"tel aviv"=>"IST", :theni=>"IST", :thiruvananthapuram=>"IST", :trincomalee=>"IST", :vadodara=>"IST", :varanasi=>"IST", :"vasai-virar"=>"IST", :visakhapatnam=>"IST", :fukuoka=>"JST", :fukushima=>"JST", :hamamatsu=>"JST", :himeji=>"JST", :hiroshima=>"JST", :kagoshima=>"JST", :kawasaki=>"JST", :kitakyushu=>"JST", :kobe=>"JST", :kumamoto=>"JST", :kyoto=>"JST", :matsuyama=>"JST", :nagasaki=>"JST", :nagoya=>"JST", :naha=>"JST", :niigata=>"JST", :okayama=>"JST", :osaka=>"JST", :sagamihara=>"JST", :sapporo=>"JST", :sendai=>"JST", :shizuoka=>"JST", :suzuka=>"JST", :tokyo=>"JST", :utsunomiya=>"JST", :yokohama=>"JST", :yokosuka=>"JST", :bishkek=>"KGT", :kemerovo=>"KRAT", :krasnoyarsk=>"KRAT", :norilsk=>"KRAT", :busan=>"KST", :daegu=>"KST", :gunsan=>"KST", :incheon=>"KST", :jeju=>"KST", :mokpo=>"KST", :pyongyang=>"KST", :seoul=>"KST", :"lord howe island dst"=>"LHDT", :kiritimati=>"LINT", :magadan=>"MAGT", :taiohae=>"MART", :majuro=>"MHT", :mandalay=>"MMT", :naypyidaw=>"MMT", :yangon=>"MMT", :"naberezhnye chelny"=>"MSK", :arkhangelsk=>"MSK", :astrakhan=>"MSK", :"belushya guba"=>"MSK", :bryansk=>"MSK", :cheboksary=>"MSK", :grozny=>"MSK", :kazan=>"MSK", :lipetsk=>"MSK", :moscow=>"MSK", :murmansk=>"MSK", :"nizhny novgorod"=>"MSK", :novgorod=>"MSK", :pyatigorsk=>"MSK", :ryazan=>"MSK", :"saint-petersburg"=>"MSK", :sochi=>"MSK", :stavropol=>"MSK", :syktyvkar=>"MSK", :tula=>"MSK", :vladimir=>"MSK", :albuquerque=>"MST", :aurora=>"MST", :billings=>"MST", :boise=>"MST", :calgary=>"MST", :cheyenne=>"MST", :chihuahua=>"MST", :"ciudad juárez"=>"MST", :cranbrook=>"MST", :denver=>"MST", :edmonton=>"MST", :"el paso"=>"MST", :"glendale (usa-az)"=>"MST", :helena=>"MST", :hermosillo=>"MST", :inuvik=>"MST", :lakewood=>"MST", :mazatlan=>"MST", :mesa=>"MST", :phoenix=>"MST", :provo=>"MST", :"rapid city"=>"MST", :"salt lake city"=>"MST", :scottsdale=>"MST", :tempe=>"MST", :tepic=>"MST", :tucson=>"MST", :yellowknife=>"MST", :"port louis"=>"MUT", :"kota kinabalu"=>"MYT", :"kuala lumpur"=>"MYT", :kuantan=>"MYT", :kuching=>"MYT", :miri=>"MYT", :seremban=>"MYT", :noumea=>"NCT", :kingston=>"NFT", :novosibirsk=>"NOVT", :tomsk=>"NOVT", :kathmandu=>"NPT", :pokhara=>"NPT", :yaren=>"NRT", :"st. john's (ca - nf)"=>"NST", :alofi=>"NUT", :"auckland dst"=>"NZDT", :"christchurch dst"=>"NZDT", :"palmerston north dst"=>"NZDT", :"tauranga dst"=>"NZDT", :"wellington dst"=>"NZDT", :barnaul=>"OMST", :omsk=>"OMST", :atyrau=>"ORAT", :oral=>"ORAT", :arequipa=>"PET", :lima=>"PET", :"petropavlovsk-kamchatsky"=>"PETT", :"port moresby"=>"PGT", :rawaki=>"PHOT", :angeles=>"PHT", :bacolod=>"PHT", :"baguio city"=>"PHT", :"cebu city"=>"PHT", :davao=>"PHT", :"iloilo city"=>"PHT", :mabalacat=>"PHT", :makati=>"PHT", :manila=>"PHT", :"marawi city"=>"PHT", :olongapo=>"PHT", :quezon=>"PHT", :"tarlac city"=>"PHT", :bahawalpur=>"PKT", :faisalabad=>"PKT", :"hyderabad (pk)"=>"PKT", :islamabad=>"PKT", :jhelum=>"PKT", :karachi=>"PKT", :khushab=>"PKT", :lahore=>"PKT", :multan=>"PKT", :peshawar=>"PKT", :quetta=>"PKT", :rawalpindi=>"PKT", :sahiwal=>"PKT", :sargodha=>"PKT", :sialkot=>"PKT", :"saint-pierre"=>"PMST", :kolonia=>"PONT", :palikir=>"PONT", :abbotsford=>"PST", :anaheim=>"PST", :"angels camp"=>"PST", :bakersfield=>"PST", :berkeley=>"PST", :burnaby=>"PST", :"carson city"=>"PST", :"chula vista"=>"PST", :"citrus heights"=>"PST", :coquitlam=>"PST", :"el monte"=>"PST", :escondido=>"PST", :eugene=>"PST", :fremont=>"PST", :fresno=>"PST", :fullerton=>"PST", :"garden grove"=>"PST", :"glendale (usa-ca)"=>"PST", :hayward=>"PST", :"huntington beach"=>"PST", :inglewood=>"PST", :irvine=>"PST", :kamloops=>"PST", :kelowna=>"PST", :"las vegas"=>"PST", :"long beach"=>"PST", :"los angeles"=>"PST", :mexicali=>"PST", :modesto=>"PST", :"moreno valley"=>"PST", :nanaimo=>"PST", :oakland=>"PST", :oceanside=>"PST", :olympia=>"PST", :ontario=>"PST", :orange=>"PST", :oxnard=>"PST", :paradise=>"PST", :"pasadena (usa-ca)"=>"PST", :pomona=>"PST", :"portland (oregon)"=>"PST", :"prince george"=>"PST", :"rancho cucamonga"=>"PST", :"richmond (ca-bc)"=>"PST", :riverside=>"PST", :sacramento=>"PST", :salem=>"PST", :salinas=>"PST", :"san bernardino"=>"PST", :"san diego"=>"PST", :"san francisco"=>"PST", :"san jose (usa)"=>"PST", :"santa barbara"=>"PST", :"santa clarita"=>"PST", :"santa rosa"=>"PST", :seattle=>"PST", :"simi valley"=>"PST", :stockton=>"PST", :sunnyvale=>"PST", :surrey=>"PST", :"thousand oaks"=>"PST", :tijuana=>"PST", :torrance=>"PST", :vallejo=>"PST", :vancouver=>"PST", :victoria=>"SCT", :victorville=>"PST", :visalia=>"PST", :whistler=>"PST", :whitehorse=>"PST", :adamstown=>"PST", :melekeok=>"PWT", :"asuncion dst"=>"PYST", :"ciudad del este dst"=>"PYST", :"encarnación dst"=>"PYST", :qyzylorda=>"QYZT", :"saint-denis"=>"RET", :"yuzhno-sakhalinsk"=>"SAKT", :samara=>"SAMT", :bloemfontein=>"SAST", :"cape town"=>"SAST", :durban=>"SAST", :grahamstown=>"SAST", :johannesburg=>"SAST", :maseru=>"SAST", :mbabane=>"SAST", :nelspruit=>"SAST", :"port elizabeth"=>"SAST", :pretoria=>"SAST", :rustenburg=>"SAST", :stellenbosch=>"SAST", :honiara=>"SBT", :singapore=>"SGT", :paramaribo=>"SRT", :"pago pago"=>"SST", :papeete=>"TAHT", :"port-aux-francais"=>"TFT", :dushanbe=>"TJT", :fakaofo=>"TKT", :dili=>"TLT", :ashgabat=>"TMT", :nukualofa=>"TOT", :funafuti=>"TVT", :ulaanbaatar=>"ULAT", :"artigas dst"=>"UYST", :"canelones dst"=>"UYST", :"colonia del sacramento dst"=>"UYST", :"durazno dst"=>"UYST", :"florida dst"=>"UYST", :"fray bentos dst"=>"UYST", :"maldonado dst"=>"UYST", :"melo dst"=>"UYST", :"mercedes dst"=>"UYST", :"minas dst"=>"UYST", :"montevideo dst"=>"UYST", :"paysandú dst"=>"UYST", :"rivera dst"=>"UYST", :"rocha dst"=>"UYST", :"salto dst"=>"UYST", :"san josé de mayo dst"=>"UYST", :"tacuarembó dst"=>"UYST", :"trinidad dst"=>"UYST", :tashkent=>"UZT", :barquisimeto=>"VET", :caracas=>"VET", :maracaibo=>"VET", :maracay=>"VET", :valencia=>"VET", :"komsomolsk-on-amur"=>"VLAT", :vladivostok=>"VLAT", :"port vila"=>"VUT", :"wake island"=>"WAKT", :"windhoek dst"=>"WAST", :abuja=>"WAT", :bangui=>"WAT", :bata=>"WAT", :"benin city"=>"WAT", :brazzaville=>"WAT", :bukavu=>"WAT", :cotonou=>"WAT", :douala=>"WAT", :enugu=>"WAT", :kaduna=>"WAT", :kano=>"WAT", :kinshasa=>"WAT", :lagos=>"WAT", :libreville=>"WAT", :luanda=>"WAT", :lubango=>"WAT", :malabo=>"WAT", :ndjamena=>"WAT", :niamey=>"WAT", :"port harcourt"=>"WAT", :"porto novo"=>"WAT", :uyo=>"WAT", :yaoundé=>"WAT", :agadir=>"WET", :casablanca=>"WET", :"el jadida"=>"WET", :fes=>"WET", :marrakech=>"WET", :rabat=>"WET", :tangier=>"WET", :funchal=>"WET", :"las palmas (es-canary)"=>"WET", :lisbon=>"WET", :porto=>"WET", :tórshavn=>"WET", :"mata-utu"=>"WFT", :"banda aceh"=>"WIB", :"bandar lampung"=>"WIB", :bandung=>"WIB", :bekasi=>"WIB", :bengkulu=>"WIB", :bogor=>"WIB", :cirebon=>"WIB", :jakarta=>"WIB", :jambi=>"WIB", :kediri=>"WIB", :kudus=>"WIB", :madiun=>"WIB", :malang=>"WIB", :medan=>"WIB", :padang=>"WIB", :"palangka raya"=>"WIB", :palembang=>"WIB", :"pangkal pinang"=>"WIB", :pekalongan=>"WIB", :pekanbaru=>"WIB", :pematangsiantar=>"WIB", :pontianak=>"WIB", :semarang=>"WIB", :serang=>"WIB", :surabaya=>"WIB", :surakarta=>"WIB", :"tanjung pinang"=>"WIB", :tasikmalaya=>"WIB", :tegal=>"WIB", :yogyakarta=>"WIB", :ambon=>"WIT", :jayapura=>"WIT", :manokwari=>"WIT", :sofifi=>"WIT", :ternate=>"WIT", :balikpapan=>"WITA", :banjarmasin=>"WITA", :denpasar=>"WITA", :ende=>"WITA", :gorontalo=>"WITA", :kendari=>"WITA", :kupang=>"WITA", :makassar=>"WITA", :mamuju=>"WITA", :manado=>"WITA", :mataram=>"WITA", :palu=>"WITA", :raba=>"WITA", :samarinda=>"WITA", :singaraja=>"WITA", :"apia dst"=>"WST", :perth=>"WST", :"el aaiún"=>"WT", :yakutsk=>"YAKT", :chelyabinsk=>"YEKT", :magnitogorsk=>"YEKT", :perm=>"YEKT", :surgut=>"YEKT", :tyumen=>"YEKT", :ufa=>"YEKT", :yekaterinburg=>"YEKT"}
  end

  def zone_offset 
    {:A=>["+", "1"], :ADT=>["-", "3"], :AFT=>["+", "4:30"], :AKDT=>["-", "8"], :AKST=>["-", "9"], :ALMT=>["+", "6"], :AMST=>["-", "3"], :AMT=>["-", "4"], :ANAST=>["+", "12"], :ANAT=>["+", "12"], :AQTT=>["+", "5"], :ART=>["-", "3"], :AST=>["-", "4"], :AZOST=>[], :AZOT=>["-", "1"], :AZST=>["+", "5"], :AZT=>["+", "4"], :B=>["+", "2"], :BNT=>["+", "8"], :BOT=>["-", "4"], :BRST=>["-", "2"], :BRT=>["-", "3"], :BST=>["+", "1"], :BTT=>["+", "6"], :C=>["+", "3"], :CAST=>["+", "8"], :CAT=>["+", "2"], :CCT=>["+", "6:30"], :CDT=>["-", "5"], :CEST=>["+", "2"], :CET=>["+", "1"], :CHADT=>["+", "13:45"], :CHAST=>["+", "12:45"], :CKT=>["-", "10"], :CLST=>["-", "3"], :CLT=>["-", "4"], :COT=>["-", "5"], :CST=>["-", "6"], :CVT=>["-", "1"], :CXT=>["+", "7"], :ChST=>["+", "10"], :D=>["+", "4"], :DAVT=>["+", "7"], :E=>["+", "5"], :EASST=>["-", "5"], :EAST=>["-", "6"], :EAT=>["+", "3"], :ECT=>["-", "5"], :EDT=>["+", "11"], :EEST=>["+", "3"], :EET=>["+", "2"], :EGST=>[], :EGT=>["-", "1"], :EST=>["-", "5"], :ET=>["-", "5"], :F=>["+", "6"], :FJST=>["+", "13"], :FJT=>["+", "12"], :FKST=>["-", "3"], :FKT=>["-", "4"], :FNT=>["-", "2"], :G=>["+", "7"], :GALT=>["-", "6"], :GAMT=>["-", "9"], :GET=>["+", "4"], :GFT=>["-", "3"], :GILT=>["+", "12"], :GMT=>[], :GST=>["+", "4"], :GYT=>["-", "4"], :H=>["+", "8"], :HAA=>["-", "3"], :HAC=>["-", "5"], :HADT=>["-", "9"], :HAE=>["-", "4"], :HAP=>["-", "7"], :HAR=>["-", "6"], :HAST=>["-", "10"], :HAT=>["-", "2:30"], :HAY=>["-", "8"], :HKT=>["+", "8"], :HLV=>["-", "4:30"], :HNA=>["-", "4"], :HNC=>["-", "6"], :HNE=>["-", "5"], :HNP=>["-", "8"], :HNR=>["-", "7"], :HNT=>["-", "3:30"], :HNY=>["-", "9"], :HOVT=>["+", "7"], :I=>["+", "9"], :ICT=>["+", "7"], :IDT=>["+", "3"], :IOT=>["+", "6"], :IRDT=>["+", "4:30"], :IRKST=>["+", "9"], :IRKT=>["+", "9"], :IRST=>["+", "3:30"], :IST=>["+", "1"], :JST=>["+", "9"], :K=>["+", "10"], :KGT=>["+", "6"], :KRAST=>["+", "8"], :KRAT=>["+", "8"], :KST=>["+", "9"], :KUYT=>["+", "4"], :L=>["+", "11"], :LHDT=>["+", "11"], :LHST=>["+", "10:30"], :LINT=>["+", "14"], :M=>["+", "12"], :MAGST=>["+", "12"], :MAGT=>["+", "12"], :MART=>["-", "9:30"], :MAWT=>["+", "5"], :MDT=>["-", "6"], :MESZ=>["+", "2"], :MEZ=>["+", "1"], :MHT=>["+", "12"], :MMT=>["+", "6:30"], :MSD=>["+", "4"], :MSK=>["+", "4"], :MST=>["-", "7"], :MUT=>["+", "4"], :MVT=>["+", "5"], :MYT=>["+", "8"], :N=>["-", "1"], :NCT=>["+", "11"], :NDT=>["-", "2:30"], :NFT=>["+", "11:30"], :NOVST=>["+", "7"], :NOVT=>["+", "6"], :NPT=>["+", "5:45"], :NST=>["-", "3:30"], :NUT=>["-", "11"], :NZDT=>["+", "13"], :NZST=>["+", "12"], :O=>["-", "2"], :OMSST=>["+", "7"], :OMST=>["+", "7"], :P=>["-", "3"], :PDT=>["-", "7"], :PET=>["-", "5"], :PETST=>["+", "12"], :PETT=>["+", "12"], :PGT=>["+", "10"], :PHOT=>["+", "13"], :PHT=>["+", "8"], :PKT=>["+", "5"], :PMDT=>["-", "2"], :PMST=>["-", "3"], :PONT=>["+", "11"], :PST=>["-", "8"], :PT=>["-", "8"], :PWT=>["+", "9"], :PYST=>["-", "3"], :PYT=>["-", "4"], :Q=>["-", "4"], :R=>["-", "5"], :RET=>["+", "4"], :S=>["-", "6"], :SAMT=>["+", "4"], :SAST=>["+", "2"], :SBT=>["+", "11"], :SCT=>["+", "4"], :SGT=>["+", "8"], :SRT=>["-", "3"], :SST=>["-", "11"], :T=>["-", "7"], :TAHT=>["-", "10"], :TFT=>["+", "5"], :TJT=>["+", "5"], :TKT=>["+", "13"], :TLT=>["+", "9"], :TMT=>["+", "5"], :TVT=>["+", "12"], :U=>["-", "8"], :ULAT=>["+", "8"], :UYST=>["-", "2"], :UYT=>["-", "3"], :UZT=>["+", "5"], :V=>["-", "9"], :VET=>["-", "4:30"], :VLAST=>["+", "11"], :VLAT=>["+", "11"], :VUT=>["+", "11"], :W=>["-", "10"], :WAST=>["+", "2"], :WAT=>["+", "1"], :WDT=>["+", "9"], :WEST=>["+", "1"], :WESZ=>["+", "1"], :WET=>[], :WEZ=>[], :WFT=>["+", "12"], :WGST=>["-", "2"], :WGT=>["-", "3"], :WIB=>["+", "7"], :WIT=>["+", "9"], :WITA=>["+", "8"], :WST=>["+", "13"], :WT=>[], :X=>["-", "11"], :Y=>["-", "12"], :YAKST=>["+", "10"], :YAKT=>["+", "10"], :YAPT=>["+", "10"], :YEKST=>["+", "6"], :YEKT=>["+", "6"], :Z=>[]}
  end

end

class Time
  include EasyTimeZone
end