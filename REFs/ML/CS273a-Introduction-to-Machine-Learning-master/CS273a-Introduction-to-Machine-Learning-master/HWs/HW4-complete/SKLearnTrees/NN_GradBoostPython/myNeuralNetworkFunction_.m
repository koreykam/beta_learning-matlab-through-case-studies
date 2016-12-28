function [Y,Xf,Af] = myNeuralNetworkFunction_(X,~,~)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Generated by Neural Network Toolbox function genFunction, 20-Mar-2015 12:39:53.
%
% [Y] = myNeuralNetworkFunction(X,~,~) takes these arguments:
%
%   X = 1xTS cell, 1 inputs over TS timsteps
%   Each X{1,ts} = 91xQ matrix, input #1 at timestep ts.
%
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = 1xQ matrix, output #1 at timestep ts.
%
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1_xoffset = [1;15;19618;15120.44;0;19824.04;0;0;18888;20000;0;0;1.593125e-11;0;0;20000;3.183351e-12;0;0;20000;5.842627e-12;0;0;19618;3.178774e-12;0;0;19710;4.217768e-12;0;0;-0.0001144677;7.534254e-07;0;0;-0.03869538;7.117865e-09;0;0;-1109.221;2.648108e-09;0;0;5051.925;0.06274214;0;0;1180.775;0.02966166;0;0;92286.06;-5.046244;-2.522183;-2.524061;1.007779;0.02034824;0;0;16.92135;0.01622858;0;0;0;0.0003778068;0;0;0;0.0202361;0;0;248.1251;0.006060873;0;0;-28.6214;9.998757e-09;0;0;-25.14949;9.998757e-09;0;0;-3.239328;9.998757e-09;0;0;-2.232139;9.998757e-09;0;0];
x1_step1_gain = [0.00547945205479452;0.00144927536231884;0.000169419737399407;0.000122398945900278;0.000101879109230196;0.000171906372913057;0.00012607899984051;0.000196059209881384;0.000159553250897487;0.000175085354110129;0.0011041671267363;0.000271923861318831;1.14585929421843;1.42438475480997;1.32804505791272;0.000164028540966128;1.30536118365202;1.43578934673021;1.44700419486516;0.000320615581917281;1.31438602072109;1.54139136774592;1.44079762556551;0.000169419737399407;1.29343433331163;1.54719485836205;1.40626900660454;0.000242865816636308;1.26860488349789;1.47908864474066;1.32933557813801;2949.75679255245;564.700635351286;618.30568167274;882.887217779583;0.000303705371259258;1.46051818483571;1.69611834835387;1.71307970617257;0.00180305646812663;1.52245121041084;1.55180828339744;1.60376821379513;0.00216865640892185;1.96948507399149;1.8551051566358;1.93387875160391;0.00455899683833569;1.80344547175311;1.95105010394219;1.90107743563665;2.20330819233832e-06;0.00373709084563647;0.00381399393391511;0.185340734112407;0.0285524570952578;1.66427598968335;1.76089044708128;1.82718318699119;0.0240735910419279;1.56392167811423;1.78252483948364;1.66457069473355;0.01999988000072;1.54833252370664;1.82211427207446;1.57657089524002;0.01999992000032;1.59991693231287;1.80266415735816;1.67320891351852;0.0308209150729685;1.79955296530981;1.89792755800304;1.87470942003989;0.039697410458521;1.79989976178035;1.90767610711983;1.84779013538758;0.0406766561754791;1.72249415189367;1.83436256359506;1.80444181396927;0.381942083830176;1.84990775296034;1.94895302243635;1.92356521270784;0.493761813251382;1.87735962397544;2.00701431432714;1.9616651398373];
x1_step1_ymin = -1;

% Layer 1
b1 = [-1.5209353604025914741;-1.4076182580559224444;0.65708081651217209451;-0.16169915698131087645;-0.12572328328227308503;-0.18177242793495124173;-0.64025444798222863607;0.98813739314991411167;1.2184665286787192962;1.6275300899636147012];
IW1_1 = [0.0077749580745064836643 0.094004834603720388575 0.13708014045638119982 0.44747043895840110661 -0.23413146690537528505 -0.38992523991076832868 -0.67046354850581291185 0.40966444289807074641 0.45972057196737331486 0.38991829622385187903 0.26386197271772293682 -0.054134686893000577568 -0.2518133701045329742 0.14557023763801393845 0.031867609500566072833 0.059280441997121673114 0.22095401276346532393 0.002746914466115617931 0.038091878333122275446 0.5735950955483026803 0.049862216290453391376 0.0039328772719296085925 -0.20546579815237386857 0.1049281263013726595 -0.19221926222494914449 0.098058378695498216171 -0.011933154281146034909 -0.99460994642216116191 0.11999418570827775909 -0.090049766642236517278 0.15570424542610553087 -0.13001201912613621903 -0.25746472861700758772 -0.14321526220507238558 0.22697219650018460313 -0.39519046007544100796 -0.049795024630997025694 0.12310336718919301369 0.12427640960446501017 0.31092827969431729995 -0.0037549896360251650701 0.11622933478484093195 0.16640118744519316607 -0.0062157763827903993181 -0.35556168300647988945 9.1180752755347371785e-06 -0.08413129503796820674 0.37351357869239465437 -0.29672804887957909825 -0.18051731165926601652 -0.12344017235562966539 0.11752026118625084894 -0.02336776652962302761 0.12775140031908885363 0.093150085505396051921 -0.37010443968910394785 -0.063340174666543597182 0.018028741160833579998 -0.031260072945852195037 0.19775919134668512589 0.092946719676254896392 0.060802857951925984303 0.098193550533267670577 -0.23579006032202357024 0.17786871276215540649 -0.033817009074990994622 -0.10610928068050658191 0.57299702011335074125 0.10465030386921601868 -0.044817263946723001622 -0.056575545144353568683 0.86508473522749562701 -0.28223040671723453876 0.15402672043095158583 0.23435803140411451406 -0.46562009528170605899 -0.060268186832966842703 0.10523214219250422163 0.073029603918108254579 0.33337005124101343201 -0.078350387067967708354 0.09228648507845377269 0.082744799210691610813 0.45478244402926171208 -0.066358322426712759712 0.062573413521216481037 0.050888520836099376821 -0.36182406214904155872 -0.20754870135072339687 0.13214687599288732489 0.2415540350908088052;0.13808641912349989278 0.53967489590226080942 -0.37134262111062382727 -0.26086278635925147507 0.09776837596872528513 -0.031058387550880542372 -0.080108518530458583395 -0.26468215678333473218 0.028755121236734702828 -0.59180364218865055825 0.20262060567140163791 0.35586743510421364745 -0.40100239472265902796 -0.15585663143099429129 -0.10961227154058753031 -0.75300573388323754909 -0.26682477453653169475 0.044464991661177150073 -0.19285031093853866047 -0.12439343199005487017 -0.31506809120249595901 -0.20015096939922460972 0.26943633484438272996 -0.25900182568208962586 -0.065573153531412686768 -0.052431866922010406107 0.55554991151277877126 -0.26087091253773253552 0.25493772203498532569 0.25606660122941737878 0.13193328233107778913 -0.15635985220584666666 -0.14026076544916638023 -0.1828768605860691121 0.53769705590965755082 -0.055359802273175606757 0.11782086381815556897 0.13558434080573619762 0.043174678770036986619 0.24603924200778598541 -0.30461123570832421281 0.00810530638697334882 0.20898039179475749738 0.28176448274740983901 -0.26112392903810194289 0.049627463004521372991 -0.048531556482556567622 -0.13470376169598419214 -0.12545678751859107303 -0.14989709161048350716 0.26991677355254756199 -0.010797355032788322204 0.25137359054649510703 0.074221074835160258387 0.16652542936699613052 -0.027948561362722227491 -0.29168265911629126519 -0.096404470519347557067 0.50229202317025534175 0.62430550841462806311 0.071916126362719323684 0.46791757987302429189 0.1222043235980491277 -0.43816121634667443141 0.40932725488226673338 0.0011524983195803986669 0.45814233415899896507 -0.046765466503313465885 -0.37048124255369907498 -0.043475896502304350877 0.085803819502114214712 -0.25419988489131750686 -0.025321804123892444754 -0.09326369790431252027 0.0035341561997169410048 -0.59558569810796779809 -0.29399028776443408839 0.057789641898907825879 -0.082145341883052641618 -0.50121233251461017044 -0.054361735982597123029 0.17861561968715730653 0.03573869051594262547 -0.15674920851892684692 -0.25953134464927340996 0.0007008197537658605869 0.035612298509853465567 -0.19198932939468232872 -0.066585475643531247258 0.021280188951162667954 0.049901709440663299944;-0.033820538196944957554 -0.16806017282235727328 2.6038039149089806656 1.5328834118404619513 -0.65386231136543127018 2.2315746583714228812 -2.7959185077553572185 -0.014018638878466528619 0.65814512339667852192 -1.5325793554363063009 0.45759692568909227095 -0.11627772645878384217 0.13974449955827383807 0.084445179356036903506 0.25822405692633682017 -0.60472444317596329988 -0.29448062614079256738 0.12488582279622685578 0.11500293280273368723 -1.6338066088906342266 0.12579328703183453864 -0.0069244191100110100839 0.036102258147065503791 2.4767811757250592919 0.19717195736519105287 0.20594742181951145032 0.19702069673209754441 -1.9276562963336114631 -0.34886429778228533749 -0.095368954923269910751 -0.21701992130602748565 0.40724278845004935334 0.17768175098805688572 -0.087841559761401025175 -0.33002944375174458891 0.43548652796382864016 -0.031946731950748152862 -0.1287335571851114524 -0.12132875322508254734 -0.20145825349647605851 0.014086874282228706648 -0.080583540457591001926 -0.077832216412475868639 -0.36121380931477831133 0.037910266480613998008 -0.029947720759327209339 0.081682577635070641175 0.15613011509335400495 0.13626641443838000134 0.33653729179416641548 0.19001903428954189379 -0.073946129296069085246 -0.10706414742454052613 -0.034256289283566061787 0.46820153086280058563 -0.45178873375916855926 -0.00066177378290772047309 -0.00096521154994748652872 -0.13924086929047213568 -0.26794396996490366103 0.0034313366531903317924 -0.15283567660494484786 -0.088287548986654307281 0.073333101813757087251 -0.063623361380758178263 0.13632628205995805937 0.16003945286546927829 -0.33704764748082943759 0.026824223396604333913 0.010300547140562367476 0.075189092717146938094 0.11909556266598340935 -0.061034693494709885142 0.18933154132231491684 0.11131789682158860222 0.045500928502359178074 -0.092162287935366224434 -0.0055270457272136117727 -0.013828216229083213282 -0.050315105217681191374 0.016018877293714310628 -0.013435903679756836665 0.0088918601406766245576 0.63816870868061958966 0.06197810624074927971 0.062324524116403025309 0.063928464339425436491 -0.44339139736988358864 -0.13757653798648708521 -0.02748884293471649809 -0.077044762618536835608;0.06515506274542948173 0.13006881177844484276 0.32500887284471779992 -0.63788176226781612144 1.0787998587431000264 0.20247254465001074397 1.8725519636484144748 -0.38328700379977242996 0.66357808191709954926 -0.10033384201272370351 -0.077861720588038307866 0.087161914398955375738 0.24461304348523138508 0.0065842491295424526374 -0.24353110089920237957 -0.21631906842634721078 0.30144582936411828955 -0.21708051173095765929 -0.095677854459755684591 -0.78691046537130437954 0.12482256567678282067 -0.16456177734962795789 -0.29157147997727017597 0.20810945713984815852 -0.036651094361833322366 -0.010005489294257213437 0.0048160802224835423668 -0.10578370140246286246 0.37881120306488846872 -0.20292853006161087892 -0.12646450126739253172 0.32843461178751776064 -0.071897654293463869601 0.25316084992305309953 -0.50903111693839153684 0.72037800616933733711 0.41317241356762585136 -0.048989174485849225349 0.0034924878897471464678 -0.40131588548195101795 0.099196614781276393202 -0.13871095399866537057 0.0042919130618769146812 -0.57017620545959213363 0.36716986227557396605 -0.13620561364600658472 -0.19621086808998727813 1.1101193991234556968 0.12669683651593752205 -0.32367053879603052691 -0.27109921711631473906 0.16908871017621143751 -0.10484766409501129758 -0.24057456327924978123 0.28223163486297125901 -0.44168099442355279738 -0.16329414251268226099 -0.20492239612808033078 -0.27792112927119855259 -0.13103904398281562838 0.19483529461364237911 -0.041421187739955504792 -0.053482160444793057363 -0.51971699052796205276 -0.021084754112866491149 -0.033045682181766983243 -0.064826173783368773451 0.23808570601496065189 0.22489826502473464487 -0.068268038317800039394 -0.33384363435474706527 1.4846519196933152251 0.027271540583001532831 -0.26824540566853066759 -0.12650944624589055554 -0.40932539139057444455 0.22445267562105000736 -0.21192304917641310857 -0.15690170014468851623 0.27936315346133716586 0.045155657443381930216 -0.074908260404688190026 0.064525902785059097155 0.035826880844381382707 0.12589711577528819864 -0.18735670573670965 -0.10429470786144930117 -0.12872121128105520893 0.01441219365908179631 -0.20430706607705678701 -0.18516116031597906755;-0.20534467923319407734 0.20258799494619789128 0.20215347831920710275 0.0694474827680211515 -0.6137325173421213087 -0.0067323729663986940641 -0.11523506984824939681 0.17692643350159228954 0.57926607388553663647 0.13585276848612179434 -0.6377352481331786116 -0.53421539417988661569 0.2056303630482048117 -0.3680701476196930888 0.14898386148948827845 -0.31451354171666467963 -0.45412245019831043447 -0.46115936163577281315 0.019506440077577791303 0.51829044697603121605 -0.12289801192750458847 0.20752814407106898176 0.097223925021471341301 -0.03101630241634593943 0.19973640276731527421 -0.019372626278017578139 -0.24082380224014987569 0.40894673798339431503 0.14328137572806681765 -0.064709236059567937227 -0.03045235181976656616 0.54280263057460664822 -0.094405874651335958125 -0.058596532888437295739 -0.10281038928158139911 -0.15204659132129783039 -0.43886366931083936604 -0.27421117015198842592 0.075395525820464756594 -0.13913275588351345369 0.19520480224487840593 0.40176883664839074806 -0.4096268238943842066 -1.0226241592419185178 -0.25501291714116208764 -0.13011644537855876491 -0.17045345390538560459 -0.54730707245993126531 -0.50825931652779365866 -0.085127474068606170943 -0.33777049859089008921 -0.11650624376496353241 0.1111274060800258312 0.23087385431810761305 -0.22244339605553459238 -0.27520373428581873521 0.22625950526965091236 0.14285525732504283924 -0.26672556425979659922 0.081468274967739298664 0.14780757570571986803 0.44048858231652116002 -0.39640756938067678306 -0.43455062667461724635 0.38492716535212134765 0.3328273306399653908 -0.066674635891841846358 -0.48767371524615893419 0.28453757808046054034 -0.46954765198359005307 0.12195308241024405138 -0.98063987299027322031 0.13030086707317634076 -0.097883747835722734187 0.28951413673212345046 -0.29083505402583842425 0.25312899712851288925 0.095998661959649733699 0.11689802918269871779 0.24246981397269712355 -0.23876134846473312523 0.54375141688413941576 -0.28929370224290895663 -0.008314332869925875058 0.38205368994642058267 0.3782724022883056092 -0.32933253023470504539 0.34801509083431070302 0.10268114805673585199 0.43507174095829831417 -0.26317335969433836018;0.013555897410328468164 -0.027035599961170230648 0.60352268973543476971 0.36471752161602466469 0.4047328125277315225 0.53184258534213557645 0.18577901542732497275 -0.050916297996025261519 0.2796142749780766712 0.49212843833934771798 0.24641035199384672683 -0.025823892925539777832 0.25523776541316084421 -0.17723678988370217269 -0.14203327790369371653 -0.1820248414239210577 -0.066544061290287212507 -0.10021093639589792601 -0.078914385397176323167 -0.70494541024502832549 0.0540785611588170817 -0.068011943476865857616 -0.0079166574232997100752 0.26994062141109353981 0.15027304234317573339 0.017760151538224810269 -0.030253325398236760591 -0.6703045965059032385 0.077944904180047888675 -0.15187776679802725277 -0.18844005488870907428 0.13006009907860313635 0.073543732641472583933 -0.017777173836182800365 -0.09150256035324261239 0.070798227677537822755 -0.10195694242329847445 0.016524591227079693523 0.014261126391249047754 0.24878882828516477033 -0.0035836324500635573925 0.041148245028012134239 0.0040343663906285305576 0.3274620412536290992 0.14325446972305069804 0.05822322222185316587 0.16003152951862531506 -0.2207499966833925964 0.26872557082958653529 0.0097807026815010487952 -0.062914245276013303076 -0.08790465867551290613 0.15729804415444886834 0.012138756797625542549 -0.066483409986763747357 -1.1893820103072250127 -0.083609305799750163746 0.092573885780639214582 0.023059475074978335457 -0.026220009815918154938 0.011921494585873935665 -0.070677941180913222974 -0.144258739623326665 0.059817081224214099788 -0.065351874973784432332 0.04771567956708708258 0.015464413631253880535 -0.23175857569639421452 0.16007356873527067709 -0.14589606322747125655 -0.12286364128967339204 -0.10163767998142078652 0.080632901502955309225 -0.065500840936448229135 -0.070561506672442361743 0.36825034417490254413 0.045394225172593061224 -0.030583346297602280461 0.0076606914779309108476 -0.059930111637499165755 0.13940140988895480256 -0.1458111280403443788 -0.13189201840156491996 0.21991282089434938118 0.029150300383861543763 0.0072478554708914517957 -0.021539491559842322693 0.18202094018460290847 -0.15341426338795952078 0.089117241958029863591 0.074415476883934308927;0.11383311445191623967 0.13093173184039025303 0.37740151932482518538 0.41655343122658639032 -0.32072156286627467869 0.59939248213250617692 0.17569678392281168344 0.079275799014042705459 -0.33589497538471324578 -0.52365426149543770062 -0.13637114650032117202 0.089941192856467261363 -0.27016829828106425637 0.10498167330851346235 0.069602151930441877314 -0.31850819863798529585 0.17567279828732779157 0.035504170476659220601 0.0081524890573316313724 0.61763079945293264394 0.13056347629897488427 0.020577158021444968972 -0.19896171833285553054 0.096838217225356501561 -0.2239408646193432606 -0.04412083290072774111 -0.063939639589112487461 -0.42489448960511622122 -0.02754889862402819245 0.18428887537289112553 0.33581976815058678376 -0.15862843906472134936 -0.030240249284240419692 -0.1375419673541742327 0.17791349244583040679 -0.41864637369268709044 -0.14107397817452821398 0.095624122429997904238 0.1036866206663756701 0.29143353066887889291 0.063431710900039448009 0.043839496591312893115 0.0708975455752962197 0.57321160237946433558 -0.077596395433792320073 -0.14860820000383268003 -0.18768840954940174681 0.064952850788177057817 -0.37988574502525224164 0.11347818350998493953 0.28910930867370382424 0.029021972033617497722 0.39200948839943688951 0.054662140608068281178 -0.12046141846270999598 0.40676447339951565807 -0.074391389992404077791 0.087911257232957784602 0.091738245774098045593 0.26558159847289442013 0.12640136981805769056 0.061060448428299558821 0.060214460449572598799 -0.11126083619959223348 -0.14401343326166529679 0.11087456616816125654 0.047834757617551834641 0.44639106914784909552 0.02572966963488431541 0.036826731956160832504 0.025298424385267422043 0.4316411933400397527 -0.25308956364991930243 0.16633346908608839798 0.22358731166564532744 -0.14836252334094846006 -0.2441856775326648743 0.20759431030080460756 0.16025871973589495001 0.080668718997759750189 0.027860244061027598927 0.11234952159387445736 0.029887342337711522711 -0.2086834620170490151 -0.13255368018387267415 0.13740118195567874171 0.090583544923622041911 -0.21229822946318366306 -0.08388693172111857943 0.07832956361016972513 0.14611620076970535664;-0.15794994291866673586 0.13524536072822984645 0.60615755862999221026 0.081393706942705812413 0.06862843008975189063 -0.12741263797995328044 -0.62421033223000910173 -0.093582039636118302672 -0.014927659675291119271 0.29977945230829183831 -0.084168065416641485443 0.62049282393510230005 -0.0984560019979153489 -0.14208176188290991271 -0.2298251874533304151 0.3334744249573664554 0.2889267946808091736 0.15177720008716566458 -0.083312194885486079432 -0.48576216644951403234 0.10214327592115488019 -0.19834992565273518172 -0.26965145613061602958 0.56635481416038024882 -0.01260586164347132429 -0.18101246883721619496 -0.0059738933611779895111 0.2941320476843735654 0.046690859147466103052 -0.037302130560734052256 -0.0080096862442305058472 -0.41372531954895491735 0.14153797749546251361 -0.050824050405701100275 0.20619301292240932444 0.080368751712173669421 0.22377745815089830628 -0.16409128016101404146 -0.27180113749800655087 -0.61467079845251293424 -0.04036579538832024 0.006222162254972886386 -0.052555385650166722145 0.37891606793447890622 0.071802439135364520828 0.31317047398750830212 0.11774092350089092329 -0.10418533239903121634 -0.49421233637068645583 -0.063004137341866939259 -0.15199643719811728459 -0.0040450651541247993268 -0.027793867886352088825 -0.19073720869619698037 -0.33171439711177413967 -0.50076791487713123718 0.058306837368712782776 -0.23201904075314716547 -0.029536527918007059179 -0.22840407313682581369 0.24726268463376843698 0.043665803273734885015 0.10732407197649627972 0.17020247480967734544 -0.00070998007093676668983 -0.046082482536900074011 0.12326764486857076653 -0.52846540420287346773 0.049449282781719533508 -0.07774094154880442642 -0.062422238296822404879 -0.65278856761285519728 0.19267130465310058907 -0.25142418104994024297 -0.22911204105434665457 -0.13315149488454003368 0.24039255975685513977 0.09335653342363887941 0.035246684464049236885 -0.079882530790913230945 0.062995080925837138031 -0.09142735185715110402 -0.15132006745517931345 -0.07391502032759678098 -0.17510116481352000495 -0.2662253270593117338 -0.19428753259449951796 0.40035905720532305452 0.16458948986825922001 0.18796078206946323363 0.11450065645381726775;-0.3241279552386570062 -0.0012161030338604800205 0.24183411266354679081 0.38404650307013177279 -0.082010552040682596631 0.28711855614917453083 -0.36316179813164650714 0.19279915748579901091 0.25102525217363391707 -0.094986494504355714619 -0.1795659937427601105 -0.30390841239790211681 0.097533689508002188728 -0.04499357565929072017 0.081075332793034776691 -0.18284883686414771242 0.045011948114991817693 0.019081631615722880607 0.12651393446050038238 -0.14816384954354774872 0.20928986889351991474 -0.10541838624061883323 -0.09895559898764284823 0.1165417928496277622 -0.028381064709909142874 0.0088144866636572730828 -0.2298242409920344953 -0.095531447699607002777 0.10823490986736089559 0.001687569501229724267 -0.027289403225594408009 -0.26398437923040735109 0.17991960186248068254 0.17990239487492259984 -0.24878296886595499537 0.091288969509862830098 -0.30797856467869261232 0.21763222145709718025 -0.46544302902019674129 -0.1792999570328953074 -0.59172792210767044541 -0.45177472249264527537 -0.25387243886414606608 0.12390360420392806939 0.33037263556289703237 -0.033714188361243881131 0.054248531176855754876 0.22928394877184971046 0.20736457800427210429 -0.18396249297273109535 0.10906878440223961857 -0.30043617539657657689 -0.25929954892347562012 0.036791609091160880352 0.077530869459746437622 -0.33867474335573299893 -0.028894859465319722158 0.23515358860496327065 0.065925588825123795922 -0.14825622444688538182 -0.12968238188063169192 0.17719088955983858247 0.14823030166456152568 0.14763135726590678742 -0.2333370046358614891 0.096714581541998162484 -0.22761138850997678085 0.42932434819398823667 -0.25754667123442109844 -0.30298558259697755402 0.085387168243554814606 0.079371262013883642217 0.32973232293291321326 -0.28874714450239907793 0.018706094902993207485 -0.16015453799522810785 -0.30707114686579778384 -0.042732901155261397708 -0.34602838969379207112 0.41629999480595869521 0.56058714515885599283 0.57637792721153702225 -0.26449047264431324589 -0.1100199478734259495 -0.10081723014177743081 -0.20604393875315077378 -0.2841660393145084007 -0.3445815503167922178 0.26605447496482165226 -0.0015285354901235811802 -0.26740579193609526065;-0.1233349725593699403 -0.10848363978804649588 0.07386150836855888413 -0.74940786353713562118 0.75880537017931515287 -0.28948228416804894225 0.49793253278844562537 0.023145928180768937654 0.6309293881709245877 0.47172756337075594235 0.32575125009262534403 0.036107963004566256959 0.28485524984165522255 -0.17380906609270388441 -0.13838970462488522917 -0.16180271663178902308 -0.064255828529869329913 -0.12160219238509745177 -0.1109369065540538879 -0.50780580438276956556 0.0849037537667318154 -0.19096996558338272254 -0.015933860443768727705 0.24683937357064536511 0.11698683775434604026 0.18607828575348209221 0.16510354642809321746 0.26242058283850239198 -0.037597728459802491618 -0.1873334554919926509 -0.26867403086315633232 0.13745443484167010895 0.040877557789878067596 0.038370552504041942343 -0.12880216928462395742 0.22016396791687292689 0.18233718920210323367 -0.14845418754756323221 -0.16934636805445502095 -0.044818625492730794491 -0.10222966219894304152 0.038023083336090252038 0.014581092779656287806 -0.75137731253503259321 0.17977171965671248643 -0.021010633558586358505 0.041349363140526562699 0.033561769925969514583 0.10734965128685935998 0.14477637158281111973 -0.038073512310805954217 -0.044644494621534767942 -0.2626646113206707045 -0.071345085726910978385 0.0704603258985364439 -0.79808152064597737141 -0.060214047491728435457 0.052528340220086205958 0.034510771751041266486 -0.19751777149844443326 -0.13454496759126735594 -0.045829555323797316335 -0.0482693410302525161 0.10587395779978714394 0.11372252636952021043 -0.063749171510469132551 -0.012643325621767424402 -0.37951054745806167556 0.025206146967027540096 -0.078833257126842790075 -0.041602062360263127039 -0.26556043402359214012 0.1636610417321712474 -0.087341902804671592286 -0.15032715920675357446 0.27237364733617852597 0.17882156974219537426 -0.11527740631871419286 -0.073322661441103637037 -0.10287022501129890195 -0.04097589017704394293 -0.11723630357177872163 -0.029354741865964741054 0.26379665123272172389 0.24026484124490365968 -0.23949520484315545144 -0.20308802315748222811 0.12387058699569519771 0.03264145869577839143 -0.049240033624472087648 -0.082073785029178572548];

% Layer 2
b2 = -0.68074108992454063216;
LW2_1 = [-0.38288137115738984928 -0.2208129962251989542 -0.52849560928474137445 0.14091040792503831125 0.035238506896584913253 -0.48490859633592042766 1.1073818332296763156 -0.19639123244603529095 0.38185451227623373738 1.0725565137395753901];

% Output 1
y1_step1_ymin = -1;
y1_step1_gain = 0.341661561673499;
y1_step1_xoffset = 0;

% ===== SIMULATION ========

% Format Input Arguments
isCellX = iscell(X);
if ~isCellX, X = {X}; end;

% Dimensions
TS = size(X,2); % timesteps
if ~isempty(X)
    Q = size(X{1},2); % samples/series
else
    Q = 0;
end

% Allocate Outputs
Y = cell(1,TS);

% Time loop
for ts=1:TS
    
    % Input 1
    Xp1 = mapminmax_apply(X{1,ts},x1_step1_gain,x1_step1_xoffset,x1_step1_ymin);
    
    % Layer 1
    a1 = tansig_apply(repmat(b1,1,Q) + IW1_1*Xp1);
    
    % Layer 2
    a2 = repmat(b2,1,Q) + LW2_1*a1;
    
    % Output 1
    Y{1,ts} = mapminmax_reverse(a2,y1_step1_gain,y1_step1_xoffset,y1_step1_ymin);
end

% Final Delay States
Xf = cell(1,0);
Af = cell(2,0);

% Format Output Arguments
if ~isCellX, Y = cell2mat(Y); end
end

% ===== MODULE FUNCTIONS ========

% Map Minimum and Maximum Input Processing Function
function y = mapminmax_apply(x,settings_gain,settings_xoffset,settings_ymin)
y = bsxfun(@minus,x,settings_xoffset);
y = bsxfun(@times,y,settings_gain);
y = bsxfun(@plus,y,settings_ymin);
end

% Sigmoid Symmetric Transfer Function
function a = tansig_apply(n)
a = 2 ./ (1 + exp(-2*n)) - 1;
end

% Map Minimum and Maximum Output Reverse-Processing Function
function x = mapminmax_reverse(y,settings_gain,settings_xoffset,settings_ymin)
x = bsxfun(@minus,y,settings_ymin);
x = bsxfun(@rdivide,x,settings_gain);
x = bsxfun(@plus,x,settings_xoffset);
end
