local v0=tonumber;local v1=string.byte;local v2=string.char;local v3=string.sub;local v4=string.gsub;local v5=string.rep;local v6=table.concat;local v7=table.insert;local v8=math.ldexp;local v9=getfenv or function() return _ENV;end ;local v10=setmetatable;local v11=pcall;local v12=select;local v13=unpack or table.unpack ;local v14=tonumber;local function v15(v16,v17,...) local v18=1;local v19;v16=v4(v3(v16,5),"..",function(v30) if (v1(v30,2)==81) then v19=v0(v3(v30,1,1));return "";else local v87=v2(v0(v30,16));if v19 then local v97=v5(v87,v19);v19=nil;return v97;else return v87;end end end);local function v20(v31,v32,v33) if v33 then local v88=(v31/(2^(v32-1)))%(2^(((v33-1) -(v32-1)) + 1)) ;return v88-(v88%1) ;else local v89=2^(v32-1) ;return (((v31%(v89 + v89))>=v89) and 1) or 0 ;end end local function v21() local v34=v1(v16,v18,v18);v18=v18 + 1 ;return v34;end local function v22() local v35,v36=v1(v16,v18,v18 + 2 );v18=v18 + 2 ;return (v36 * 256) + v35 ;end local function v23() local v37,v38,v39,v40=v1(v16,v18,v18 + 3 );v18=v18 + 4 ;return (v40 * 16777216) + (v39 * 65536) + (v38 * 256) + v37 ;end local function v24() local v41=v23();local v42=v23();local v43=1;local v44=(v20(v42,1,20) * (2^32)) + v41 ;local v45=v20(v42,21,31);local v46=((v20(v42,32)==1) and  -1) or 1 ;if (v45==0) then if (v44==0) then return v46 * 0 ;else v45=1;v43=0;end elseif (v45==2047) then return ((v44==0) and (v46 * (1/0))) or (v46 * NaN) ;end return v8(v46,v45-1023 ) * (v43 + (v44/(2^52))) ;end local function v25(v47) local v48;if  not v47 then v47=v23();if (v47==0) then return "";end end v48=v3(v16,v18,(v18 + v47) -1 );v18=v18 + v47 ;local v49={};for v63=1, #v48 do v49[v63]=v2(v1(v3(v48,v63,v63)));end return v6(v49);end local v26=v23;local function v27(...) return {...},v12("#",...);end local function v28() local v50={};local v51={};local v52={};local v53={v50,v51,nil,v52};local v54=v23();local v55={};for v65=1,v54 do local v66=v21();local v67;if (v66==1) then v67=v21()~=0 ;elseif (v66==2) then v67=v24();elseif (v66==3) then v67=v25();end v55[v65]=v67;end v53[3]=v21();for v69=1,v23() do local v70=v21();if (v20(v70,1,1)==0) then local v93=v20(v70,2,3);local v94=v20(v70,4,6);local v95={v22(),v22(),nil,nil};if (v93==0) then v95[3]=v22();v95[4]=v22();elseif (v93==1) then v95[3]=v23();elseif (v93==2) then v95[3]=v23() -(2^16) ;elseif (v93==3) then v95[3]=v23() -(2^16) ;v95[4]=v22();end if (v20(v94,1,1)==1) then v95[2]=v55[v95[2]];end if (v20(v94,2,2)==1) then v95[3]=v55[v95[3]];end if (v20(v94,3,3)==1) then v95[4]=v55[v95[4]];end v50[v69]=v95;end end for v71=1,v23() do v51[v71-1 ]=v28();end return v53;end local function v29(v57,v58,v59) local v60=v57[1];local v61=v57[2];local v62=v57[3];return function(...) local v73=v60;local v74=v61;local v75=v62;local v76=v27;local v77=1;local v78= -1;local v79={};local v80={...};local v81=v12("#",...) -1 ;local v82={};local v83={};for v90=0,v81 do if (v90>=v75) then v79[v90-v75 ]=v80[v90 + 1 ];else v83[v90]=v80[v90 + 1 ];end end local v84=(v81-v75) + 1 ;local v85;local v86;while true do v85=v73[v77];v86=v85[1];if (v86<=29) then if (v86<=14) then if (v86<=6) then if (v86<=2) then if (v86<=0) then v83[v85[2]]=v83[v85[3]];elseif (v86>1) then v83[v85[2]]=v83[v85[3]][v83[v85[4]]];else local v123=v85[2];local v124=v85[4];local v125=v123 + 2 ;local v126={v83[v123](v83[v123 + 1 ],v83[v125])};for v227=1,v124 do v83[v125 + v227 ]=v126[v227];end local v127=v126[1];if v127 then v83[v125]=v127;v77=v85[3];else v77=v77 + 1 ;end end elseif (v86<=4) then if (v86>3) then v83[v85[2]]=v58[v85[3]];else do return;end end elseif (v86>5) then v83[v85[2]]=v59[v85[3]];else local v132=v85[2];v83[v132]=v83[v132](v13(v83,v132 + 1 ,v85[3]));end elseif (v86<=10) then if (v86<=8) then if (v86==7) then v83[v85[2]]=v85[3];else v83[v85[2]]=v83[v85[3]];end elseif (v86>9) then if (v83[v85[2]]==v85[4]) then v77=v77 + 1 ;else v77=v85[3];end else for v230=v85[2],v85[3] do v83[v230]=nil;end end elseif (v86<=12) then if (v86==11) then v83[v85[2]][v85[3]]=v85[4];elseif v83[v85[2]] then v77=v77 + 1 ;else v77=v85[3];end elseif (v86>13) then v83[v85[2]]=v59[v85[3]];else local v142=v85[2];v83[v142]=v83[v142](v13(v83,v142 + 1 ,v85[3]));end elseif (v86<=21) then if (v86<=17) then if (v86<=15) then v83[v85[2]][v85[3]]=v83[v85[4]];elseif (v86==16) then v83[v85[2]]={};else local v145=v85[2];v83[v145]=v83[v145](v13(v83,v145 + 1 ,v78));end elseif (v86<=19) then if (v86==18) then local v147=v85[2];v83[v147]=v83[v147](v13(v83,v147 + 1 ,v78));else local v149=v85[2];do return v13(v83,v149,v78);end end elseif (v86==20) then local v150=v85[2];local v151,v152=v76(v83[v150](v13(v83,v150 + 1 ,v85[3])));v78=(v152 + v150) -1 ;local v153=0;for v232=v150,v78 do v153=v153 + 1 ;v83[v232]=v151[v153];end else local v154=v85[2];v83[v154](v13(v83,v154 + 1 ,v85[3]));end elseif (v86<=25) then if (v86<=23) then if (v86>22) then v77=v85[3];else for v235=v85[2],v85[3] do v83[v235]=nil;end end elseif (v86==24) then local v156=v74[v85[3]];local v157;local v158={};v157=v10({},{__index=function(v237,v238) local v239=v158[v238];return v239[1][v239[2]];end,__newindex=function(v240,v241,v242) local v243=v158[v241];v243[1][v243[2]]=v242;end});for v245=1,v85[4] do v77=v77 + 1 ;local v246=v73[v77];if (v246[1]==8) then v158[v245-1 ]={v83,v246[3]};else v158[v245-1 ]={v58,v246[3]};end v82[ #v82 + 1 ]=v158;end v83[v85[2]]=v29(v156,v157,v59);else v83[v85[2]][v83[v85[3]]]=v85[4];end elseif (v86<=27) then if (v86>26) then do return v83[v85[2]];end else local v162=v85[2];local v163={v83[v162](v83[v162 + 1 ])};local v164=0;for v248=v162,v85[4] do v164=v164 + 1 ;v83[v248]=v163[v164];end end elseif (v86==28) then do return;end else local v165=v85[2];do return v83[v165](v13(v83,v165 + 1 ,v85[3]));end end elseif (v86<=44) then if (v86<=36) then if (v86<=32) then if (v86<=30) then v83[v85[2]]=v58[v85[3]];elseif (v86>31) then v83[v85[2]][v85[3]]=v85[4];else do return v83[v85[2]];end end elseif (v86<=34) then if (v86==33) then local v168=v85[2];local v169=v83[v168];local v170=v85[3];for v251=1,v170 do v169[v251]=v83[v168 + v251 ];end else v83[v85[2]]={};end elseif (v86==35) then v83[v85[2]][v83[v85[3]]]=v85[4];else local v174=v85[2];do return v13(v83,v174,v174 + v85[3] );end end elseif (v86<=40) then if (v86<=38) then if (v86==37) then if (v83[v85[2]]==v85[4]) then v77=v77 + 1 ;else v77=v85[3];end else v83[v85[2]][v85[3]]=v83[v85[4]];end elseif (v86>39) then local v177=v85[2];local v178={v83[v177](v83[v177 + 1 ])};local v179=0;for v254=v177,v85[4] do v179=v179 + 1 ;v83[v254]=v178[v179];end else local v180=v85[2];do return v13(v83,v180,v78);end end elseif (v86<=42) then if (v86>41) then v83[v85[2]]=v83[v85[3]][v85[4]];else local v183=v85[2];local v184,v185=v76(v83[v183](v13(v83,v183 + 1 ,v85[3])));v78=(v185 + v183) -1 ;local v186=0;for v257=v183,v78 do v186=v186 + 1 ;v83[v257]=v184[v186];end end elseif (v86==43) then local v187=v85[2];do return v83[v187](v13(v83,v187 + 1 ,v85[3]));end else local v188=v85[2];local v189=v85[4];local v190=v188 + 2 ;local v191={v83[v188](v83[v188 + 1 ],v83[v190])};for v260=1,v189 do v83[v190 + v260 ]=v191[v260];end local v192=v191[1];if v192 then v83[v190]=v192;v77=v85[3];else v77=v77 + 1 ;end end elseif (v86<=51) then if (v86<=47) then if (v86<=45) then local v120=v85[2];v83[v120](v13(v83,v120 + 1 ,v85[3]));elseif (v86>46) then local v193=v85[2];local v194=v83[v193];local v195=v85[3];for v263=1,v195 do v194[v263]=v83[v193 + v263 ];end else local v196=v85[2];v83[v196]=v83[v196](v83[v196 + 1 ]);end elseif (v86<=49) then if (v86==48) then local v198=v85[2];local v199=v83[v198];for v266=v198 + 1 ,v85[3] do v7(v199,v83[v266]);end else v77=v85[3];end elseif (v86>50) then v83[v85[2]][v83[v85[3]]]=v83[v85[4]];else local v203=v85[2];v83[v203]=v83[v203](v83[v203 + 1 ]);end elseif (v86<=55) then if (v86<=53) then if (v86>52) then local v205=v74[v85[3]];local v206;local v207={};v206=v10({},{__index=function(v267,v268) local v269=v207[v268];return v269[1][v269[2]];end,__newindex=function(v270,v271,v272) local v273=v207[v271];v273[1][v273[2]]=v272;end});for v275=1,v85[4] do v77=v77 + 1 ;local v276=v73[v77];if (v276[1]==8) then v207[v275-1 ]={v83,v276[3]};else v207[v275-1 ]={v58,v276[3]};end v82[ #v82 + 1 ]=v207;end v83[v85[2]]=v29(v205,v206,v59);elseif v83[v85[2]] then v77=v77 + 1 ;else v77=v85[3];end elseif (v86==54) then v83[v85[2]]=v83[v85[3]][v83[v85[4]]];else v83[v85[2]]=v83[v85[3]][v85[4]];end elseif (v86<=57) then if (v86==56) then local v213=v85[2];local v214=v83[v85[3]];v83[v213 + 1 ]=v214;v83[v213]=v214[v85[4]];else v83[v85[2]][v83[v85[3]]]=v83[v85[4]];end elseif (v86==58) then v83[v85[2]]=v85[3];else local v222=v85[2];local v223=v83[v85[3]];v83[v222 + 1 ]=v223;v83[v222]=v223[v85[4]];end v77=v77 + 1 ;end end;end return v29(v28(),{},v17)(...);end return v15("LOL!B63Q0003023Q004944028Q0003043Q005479706503063Q00466F6C646572030A3Q0050726F7065727469657303043Q004E616D6503043Q0053544D4903083Q004368696C6472656E026Q00F03F03053Q004D6F64656C03043Q004F726273027Q004003043Q0050617274030A3Q004C656674506172616D42030D3Q00426F2Q746F6D5375726661636503043Q00456E756D030B3Q00537572666163655479706503063Q00536D2Q6F7468030A3Q0043616E436F2Q6C696465010003053Q00436F6C6F7203063Q00436F6C6F72332Q033Q006E657703063Q00434672616D65024Q00E816F33F023Q008094C859C0023Q0080F0404BC0023Q00A02QFF093E023Q00C02QFF1DBE023Q00C02QFF09BE023Q00C0070050BE023Q00C02QFF1D3E023Q00C00700503E030B3Q005269676874506172616D42030A3Q00427269636B436F6C6F7203043Q0053697A6503073Q00566563746F7233023Q00A02Q99C93F03083Q00416E63686F7265642Q01030A3Q00627269636B436F6C6F7203083Q00506F736974696F6E030B3Q005269676874506172616D41030A3Q004C656674506172616D4103063Q004D692Q646C65030A3Q00546F7053757266616365026Q00084002D85QD7E73F026Q1ADA3F02995Q98D83F023Q00C0B661F03F023Q00A063DE59C0023Q0020F6484BC0023Q0040D1FDEFBF024Q00BA1AA1BE023Q004085A2973F023Q0040B377783F023Q0080D7E8EE3F024Q00898FD03F023Q00205FD496BF023Q0040AA90D03F023Q00C0BBE6EEBF023Q00E01752E33F023Q008005ABE53F023Q00A0840EE23F03083Q00526F746174696F6E023Q00C0F79F64C0024Q00022BF53F025Q00806640030B3Q004F7269656E746174696F6E023Q00C076FE2DC0023Q002031546640023Q00A0EFA7D63F03083Q004D6174657269616C030D3Q00536D2Q6F7468506C617374696303063Q00636F6C6F7232026Q001040030B3Q005370656369616C4D65736803083Q004D6573685479706503063Q00537068657265026Q001440023Q0060CB21F53F023Q00E084DE59C0023Q00A0F0474BC0026Q001840026Q001C402Q033Q00526F64026Q002040023Q0080C116F33F023Q006078C759C0023Q00E0ED464BC0023Q00202Q00D1BD023Q00806346D63E026Q00D13D023Q00202Q00B43C023Q00806346D6BE023Q0080A5B4903C023Q002003B1C63F026Q002240023Q0020A316F33F023Q004072B859C0023Q0060E9EC4BC0023Q00A0D1FDEFBF023Q00C0C2428BBF023Q00E04B4D933F023Q00200008303E023Q0020B423EA3F023Q00E02Q75E23F023Q00E025A197BF023Q00E03374E23F023Q00C0EB21EABF024Q001D89E03F023Q00C0594BDD3F023Q00E08943CF3F023Q00C0721862C0023Q0020AE47F13F023Q008095676640023Q00202F9D41C0023Q0020B2556640026Q002440026Q002640023Q00402335F33F023Q006047B959C0023Q00C07AFB4BC0023Q00C08BEAD93F023Q0080A483D73F024Q00C162D83F026Q002840026Q002A40023Q00609716F33F024Q00D5C459C0023Q0040F1A34BC0023Q00A006C46FBF024Q00214B973F023Q00A0828BEF3F023Q00405D82C53F023Q00E0E580C53F023Q00205C89EFBF023Q00600A44C33F023Q00C06225DC3F023Q00207D88F73F023Q00405E4A65C0023Q008016D9F43F023Q0060E5786640023Q0080165923C0026Q002C40026Q002E40023Q00E09A16F33F023Q006003C059C0023Q0020F0A74BC0023Q002046CDE23F024Q00B866DB3F023Q00A0E49BF83F026Q003040026Q003140023Q002093C359C0023Q00C029914BC0023Q0060F85762BF023Q00A09984973F023Q00E056D9EF3F023Q00E07BD7B83F023Q0020CAD5B83F023Q00402BD7EFBF023Q00C0A243F73F023Q0080C2CD65C0024Q00560EF53F023Q0060E77B6640023Q00E0A74616C0026Q003240026Q003340023Q00C09716F33F023Q004057C259C0023Q00A030854BC0023Q00E08D08303E023Q00E025A1973F023Q00E07FD6D1BD023Q00C0FD5EB73D023Q00A02C6DE33F023Q00A029B0DA3F023Q00C0E49BF83F023Q0080E926F53F026Q00344000D0033Q00228Q002200016Q002200023Q00040030200002000100020030200002000300042Q002200033Q000100302000030006000700100F0002000500032Q0022000300024Q002200043Q000400302000040001000900302000040003000A2Q002200053Q000100302000050006000B00100F0004000500052Q0022000500034Q002200063Q000400302000060001000C00302000060003000D2Q002200073Q000F0030200007000E0002001206000800103Q00202A00080008001100202A00080008001200100F0007000F0008003020000700130014001206000800163Q00202A00080008001700123A000900093Q00123A000A00023Q00123A000B00024Q00050008000B000200100F000700150008001206000800183Q00202A00080008001700123A000900193Q00123A000A001A3Q00123A000B001B3Q00123A000C00093Q00123A000D001C3Q00123A000E001D3Q00123A000F001E3Q00123A001000093Q00123A0011001F3Q00123A001200203Q00123A001300213Q00123A001400094Q000500080014000200100F000700180008003020000700220002001206000800233Q00202A00080008001700123A000900093Q00123A000A00023Q00123A000B00024Q00050008000B000200100F000700230008001206000800253Q00202A00080008001700123A000900263Q00123A000A00263Q00123A000B00264Q00050008000B000200100F000700240008003020000700270028001206000800233Q00202A00080008001700123A000900093Q00123A000A00023Q00123A000B00024Q00050008000B000200100F000700290008001206000800253Q00202A00080008001700123A000900193Q00123A000A001A3Q00123A000B001B4Q00050008000B000200100F0007002A00080030200007002B00020030200007002C000200302000070006002D001206000800103Q00202A00080008001100202A00080008001200100F0007002E000800100F0006000500072Q002200075Q00100F0006000800072Q002200073Q000400302000070001002F00302000070003000D2Q002200083Q000E001206000900103Q00202A00090009001100202A00090009001200100F0008000F0009003020000800130014001206000900163Q00202A00090009001700123A000A00303Q00123A000B00313Q00123A000C00324Q00050009000C000200100F000800150009001206000900183Q00202A00090009001700123A000A00333Q00123A000B00343Q00123A000C00353Q00123A000D00363Q00123A000E00373Q00123A000F00383Q00123A001000393Q00123A0011003A3Q00123A0012003B3Q00123A0013003C3Q00123A0014003D3Q00123A0015003E4Q000500090015000200100F000800180009001206000900233Q00202A00090009001700123A000A00303Q00123A000B00313Q00123A000C00324Q00050009000C000200100F000800230009001206000900253Q00202A00090009001700123A000A003F3Q00123A000B00403Q00123A000C00414Q00050009000C000200100F000800240009001206000900253Q00202A00090009001700123A000A00433Q00123A000B00443Q00123A000C00454Q00050009000C000200100F000800420009003020000800270028001206000900233Q00202A00090009001700123A000A00303Q00123A000B00313Q00123A000C00324Q00050009000C000200100F000800290009001206000900253Q00202A00090009001700123A000A00333Q00123A000B00343Q00123A000C00354Q00050009000C000200100F0008002A0009001206000900253Q00202A00090009001700123A000A00473Q00123A000B00483Q00123A000C00494Q00050009000C000200100F000800460009001206000900103Q00202A00090009004A00202A00090009004B00100F0008004A000900302000080006004C001206000900103Q00202A00090009001100202A00090009001200100F0008002E000900100F0007000500082Q0022000800014Q002200093Q000400302000090001004D00302000090003004E2Q0022000A3Q0001001206000B00103Q00202A000B000B004F00202A000B000B005000100F000A004F000B00100F00090005000A2Q0022000A5Q00100F00090008000A2Q002F00080001000100100F0007000800082Q002200083Q000400302000080001005100302000080003000D2Q002200093Q000E001206000A00103Q00202A000A000A001100202A000A000A001200100F0009000F000A003020000900130014001206000A00163Q00202A000A000A001700123A000B00303Q00123A000C00313Q00123A000D00324Q0005000A000D000200100F00090015000A001206000A00183Q00202A000A000A001700123A000B00523Q00123A000C00533Q00123A000D00543Q00123A000E00363Q00123A000F00373Q00123A001000383Q00123A001100393Q00123A0012003A3Q00123A0013003B3Q00123A0014003C3Q00123A0015003D3Q00123A0016003E4Q0005000A0016000200100F00090018000A001206000A00233Q00202A000A000A001700123A000B00303Q00123A000C00313Q00123A000D00324Q0005000A000D000200100F00090023000A001206000A00253Q00202A000A000A001700123A000B003F3Q00123A000C00403Q00123A000D00414Q0005000A000D000200100F00090024000A001206000A00253Q00202A000A000A001700123A000B00433Q00123A000C00443Q00123A000D00454Q0005000A000D000200100F00090042000A003020000900270028001206000A00233Q00202A000A000A001700123A000B00303Q00123A000C00313Q00123A000D00324Q0005000A000D000200100F00090029000A001206000A00253Q00202A000A000A001700123A000B00523Q00123A000C00533Q00123A000D00544Q0005000A000D000200100F0009002A000A001206000A00253Q00202A000A000A001700123A000B00473Q00123A000C00483Q00123A000D00494Q0005000A000D000200100F00090046000A001206000A00103Q00202A000A000A004A00202A000A000A004B00100F0009004A000A00302000090006004C001206000A00103Q00202A000A000A001100202A000A000A001200100F0009002E000A00100F0008000500092Q0022000900014Q0022000A3Q0004003020000A00010055003020000A0003004E2Q0022000B3Q0001001206000C00103Q00202A000C000C004F00202A000C000C005000100F000B004F000C00100F000A0005000B2Q0022000B5Q00100F000A0008000B2Q002F00090001000100100F0008000800092Q002F00050003000100100F0004000800052Q002200053Q000400302000050001005600302000050003000A2Q002200063Q000100302000060006005700100F0005000500062Q0022000600074Q002200073Q000400302000070001005800302000070003000D2Q002200083Q000F0030200008000E0002001206000900103Q00202A00090009001100202A00090009001200100F0008000F0009003020000800130014001206000900163Q00202A00090009001700123A000A00093Q00123A000B00023Q00123A000C00024Q00050009000C000200100F000800150009001206000900183Q00202A00090009001700123A000A00593Q00123A000B005A3Q00123A000C005B3Q00123A000D00093Q00123A000E005C3Q00123A000F005D3Q00123A0010005E3Q00123A001100093Q00123A0012005F3Q00123A001300603Q00123A001400613Q00123A001500094Q000500090015000200100F000800180009003020000800220002001206000900233Q00202A00090009001700123A000A00093Q00123A000B00023Q00123A000C00024Q00050009000C000200100F000800230009001206000900253Q00202A00090009001700123A000A00623Q00123A000B00623Q00123A000C00624Q00050009000C000200100F000800240009003020000800270028001206000900233Q00202A00090009001700123A000A00093Q00123A000B00023Q00123A000C00024Q00050009000C000200100F000800290009001206000900253Q00202A00090009001700123A000A00593Q00123A000B005A3Q00123A000C005B4Q00050009000C000200100F0008002A00090030200008002B00020030200008002C000200302000080006002D001206000900103Q00202A00090009001100202A00090009001200100F0008002E000900100F0007000500082Q002200085Q00100F0007000800082Q002200083Q000400302000080001006300302000080003000D2Q002200093Q000E001206000A00103Q00202A000A000A001100202A000A000A001200100F0009000F000A003020000900130014001206000A00163Q00202A000A000A001700123A000B00303Q00123A000C00313Q00123A000D00324Q0005000A000D000200100F00090015000A001206000A00183Q00202A000A000A001700123A000B00643Q00123A000C00653Q00123A000D00663Q00123A000E00673Q00123A000F00683Q00123A001000693Q00123A0011006A3Q00123A0012006B3Q00123A0013006C3Q00123A0014006D3Q00123A0015006E3Q00123A0016006F4Q0005000A0016000200100F00090018000A001206000A00233Q00202A000A000A001700123A000B00303Q00123A000C00313Q00123A000D00324Q0005000A000D000200100F00090023000A001206000A00253Q00202A000A000A001700123A000B00703Q00123A000C00713Q00123A000D00724Q0005000A000D000200100F00090024000A001206000A00253Q00202A000A000A001700123A000B00733Q00123A000C00743Q00123A000D00754Q0005000A000D000200100F00090042000A003020000900270028001206000A00233Q00202A000A000A001700123A000B00303Q00123A000C00313Q00123A000D00324Q0005000A000D000200100F00090029000A001206000A00253Q00202A000A000A001700123A000B00643Q00123A000C00653Q00123A000D00664Q0005000A000D000200100F0009002A000A001206000A00253Q00202A000A000A001700123A000B00763Q00123A000C00773Q00123A000D00024Q0005000A000D000200100F00090046000A001206000A00103Q00202A000A000A004A00202A000A000A004B00100F0009004A000A00302000090006004C001206000A00103Q00202A000A000A001100202A000A000A001200100F0009002E000A00100F0008000500092Q0022000900014Q0022000A3Q0004003020000A00010078003020000A0003004E2Q0022000B3Q0001001206000C00103Q00202A000C000C004F00202A000C000C005000100F000B004F000C00100F000A0005000B2Q0022000B5Q00100F000A0008000B2Q002F00090001000100100F0008000800092Q002200093Q000400302000090001007900302000090003000D2Q0022000A3Q000E001206000B00103Q00202A000B000B001100202A000B000B001200100F000A000F000B003020000A00130014001206000B00163Q00202A000B000B001700123A000C00303Q00123A000D00313Q00123A000E00324Q0005000B000E000200100F000A0015000B001206000B00183Q00202A000B000B001700123A000C007A3Q00123A000D007B3Q00123A000E007C3Q00123A000F00673Q00123A001000683Q00123A001100693Q00123A0012006A3Q00123A0013006B3Q00123A0014006C3Q00123A0015006D3Q00123A0016006E3Q00123A0017006F4Q0005000B0017000200100F000A0018000B001206000B00233Q00202A000B000B001700123A000C00303Q00123A000D00313Q00123A000E00324Q0005000B000E000200100F000A0023000B001206000B00253Q00202A000B000B001700123A000C007D3Q00123A000D007E3Q00123A000E007F4Q0005000B000E000200100F000A0024000B001206000B00253Q00202A000B000B001700123A000C00733Q00123A000D00743Q00123A000E00754Q0005000B000E000200100F000A0042000B003020000A00270028001206000B00233Q00202A000B000B001700123A000C00303Q00123A000D00313Q00123A000E00324Q0005000B000E000200100F000A0029000B001206000B00253Q00202A000B000B001700123A000C007A3Q00123A000D007B3Q00123A000E007C4Q0005000B000E000200100F000A002A000B001206000B00253Q00202A000B000B001700123A000C00763Q00123A000D00773Q00123A000E00024Q0005000B000E000200100F000A0046000B001206000B00103Q00202A000B000B004A00202A000B000B004B00100F000A004A000B003020000A0006004C001206000B00103Q00202A000B000B001100202A000B000B001200100F000A002E000B00100F00090005000A2Q0022000A00014Q0022000B3Q0004003020000B00010080003020000B0003004E2Q0022000C3Q0001001206000D00103Q00202A000D000D004F00202A000D000D005000100F000C004F000D00100F000B0005000C2Q0022000C5Q00100F000B0008000C2Q002F000A0001000100100F00090008000A2Q0022000A3Q0004003020000A00010081003020000A0003000D2Q0022000B3Q000E001206000C00103Q00202A000C000C001100202A000C000C001200100F000B000F000C003020000B00130014001206000C00163Q00202A000C000C001700123A000D00303Q00123A000E00313Q00123A000F00324Q0005000C000F000200100F000B0015000C001206000C00183Q00202A000C000C001700123A000D00823Q00123A000E00833Q00123A000F00843Q00123A001000673Q00123A001100853Q00123A001200863Q00123A0013006A3Q00123A001400873Q00123A001500883Q00123A0016006D3Q00123A001700893Q00123A0018008A4Q0005000C0018000200100F000B0018000C001206000C00233Q00202A000C000C001700123A000D00303Q00123A000E00313Q00123A000F00324Q0005000C000F000200100F000B0023000C001206000C00253Q00202A000C000C001700123A000D008B3Q00123A000E008C3Q00123A000F008D4Q0005000C000F000200100F000B0024000C001206000C00253Q00202A000C000C001700123A000D008E3Q00123A000E008F3Q00123A000F00904Q0005000C000F000200100F000B0042000C003020000B00270028001206000C00233Q00202A000C000C001700123A000D00303Q00123A000E00313Q00123A000F00324Q0005000C000F000200100F000B0029000C001206000C00253Q00202A000C000C001700123A000D00823Q00123A000E00833Q00123A000F00844Q0005000C000F000200100F000B002A000C001206000C00253Q00202A000C000C001700123A000D00913Q00123A000E00773Q00123A000F00024Q0005000C000F000200100F000B0046000C001206000C00103Q00202A000C000C004A00202A000C000C004B00100F000B004A000C003020000B0006004C001206000C00103Q00202A000C000C001100202A000C000C001200100F000B002E000C00100F000A0005000B2Q0022000B00014Q0022000C3Q0004003020000C00010092003020000C0003004E2Q0022000D3Q0001001206000E00103Q00202A000E000E004F00202A000E000E005000100F000D004F000E00100F000C0005000D2Q0022000D5Q00100F000C0008000D2Q002F000B0001000100100F000A0008000B2Q0022000B3Q0004003020000B00010093003020000B0003000D2Q0022000C3Q000E001206000D00103Q00202A000D000D001100202A000D000D001200100F000C000F000D003020000C00130014001206000D00163Q00202A000D000D001700123A000E00303Q00123A000F00313Q00123A001000324Q0005000D0010000200100F000C0015000D001206000D00183Q00202A000D000D001700123A000E00943Q00123A000F00953Q00123A001000963Q00123A001100673Q00123A001200853Q00123A001300863Q00123A0014006A3Q00123A001500873Q00123A001600883Q00123A0017006D3Q00123A001800893Q00123A0019008A4Q0005000D0019000200100F000C0018000D001206000D00233Q00202A000D000D001700123A000E00303Q00123A000F00313Q00123A001000324Q0005000D0010000200100F000C0023000D001206000D00253Q00202A000D000D001700123A000E00973Q00123A000F00983Q00123A001000994Q0005000D0010000200100F000C0024000D001206000D00253Q00202A000D000D001700123A000E008E3Q00123A000F008F3Q00123A001000904Q0005000D0010000200100F000C0042000D003020000C00270028001206000D00233Q00202A000D000D001700123A000E00303Q00123A000F00313Q00123A001000324Q0005000D0010000200100F000C0029000D001206000D00253Q00202A000D000D001700123A000E00943Q00123A000F00953Q00123A001000964Q0005000D0010000200100F000C002A000D001206000D00253Q00202A000D000D001700123A000E00913Q00123A000F00773Q00123A001000024Q0005000D0010000200100F000C0046000D001206000D00103Q00202A000D000D004A00202A000D000D004B00100F000C004A000D003020000C0006004C001206000D00103Q00202A000D000D001100202A000D000D001200100F000C002E000D00100F000B0005000C2Q0022000C00014Q0022000D3Q0004003020000D0001009A003020000D0003004E2Q0022000E3Q0001001206000F00103Q00202A000F000F004F00202A000F000F005000100F000E004F000F00100F000D0005000E2Q0022000E5Q00100F000D0008000E2Q002F000C0001000100100F000B0008000C2Q0022000C3Q0004003020000C0001009B003020000C0003000D2Q0022000D3Q000E001206000E00103Q00202A000E000E001100202A000E000E001200100F000D000F000E003020000D00130014001206000E00163Q00202A000E000E001700123A000F00303Q00123A001000313Q00123A001100324Q0005000E0011000200100F000D0015000E001206000E00183Q00202A000E000E001700123A000F00823Q00123A0010009C3Q00123A0011009D3Q00123A001200673Q00123A0013009E3Q00123A0014009F3Q00123A0015006A3Q00123A001600A03Q00123A001700A13Q00123A0018006D3Q00123A001900A23Q00123A001A00A34Q0005000E001A000200100F000D0018000E001206000E00233Q00202A000E000E001700123A000F00303Q00123A001000313Q00123A001100324Q0005000E0011000200100F000D0023000E001206000E00253Q00202A000E000E001700123A000F00973Q00123A001000983Q00123A001100A44Q0005000E0011000200100F000D0024000E001206000E00253Q00202A000E000E001700123A000F00A53Q00123A001000A63Q00123A001100A74Q0005000E0011000200100F000D0042000E003020000D00270028001206000E00233Q00202A000E000E001700123A000F00303Q00123A001000313Q00123A001100324Q0005000E0011000200100F000D0029000E001206000E00253Q00202A000E000E001700123A000F00823Q00123A0010009C3Q00123A0011009D4Q0005000E0011000200100F000D002A000E001206000E00253Q00202A000E000E001700123A000F00A83Q00123A001000773Q00123A001100024Q0005000E0011000200100F000D0046000E001206000E00103Q00202A000E000E004A00202A000E000E004B00100F000D004A000E003020000D0006004C001206000E00103Q00202A000E000E001100202A000E000E001200100F000D002E000E00100F000C0005000D2Q0022000D00014Q0022000E3Q0004003020000E000100A9003020000E0003004E2Q0022000F3Q0001001206001000103Q00202A00100010004F00202A00100010005000100F000F004F001000100F000E0005000F2Q0022000F5Q00100F000E0008000F2Q002F000D0001000100100F000C0008000D2Q0022000D3Q0004003020000D000100AA003020000D0003000D2Q0022000E3Q000E001206000F00103Q00202A000F000F001100202A000F000F001200100F000E000F000F003020000E00130014001206000F00163Q00202A000F000F001700123A001000303Q00123A001100313Q00123A001200324Q0005000F0012000200100F000E0015000F001206000F00183Q00202A000F000F001700123A001000AB3Q00123A001100AC3Q00123A001200AD3Q00123A001300673Q00123A001400AE3Q00123A001500AF3Q00123A0016006A3Q00123A001700093Q00123A001800B03Q00123A0019006D3Q00123A001A00B13Q00123A001B00674Q0005000F001B000200100F000E0018000F001206000F00233Q00202A000F000F001700123A001000303Q00123A001100313Q00123A001200324Q0005000F0012000200100F000E0023000F001206000F00253Q00202A000F000F001700123A001000B23Q00123A001100B33Q00123A001200B44Q0005000F0012000200100F000E0024000F001206000F00253Q00202A000F000F001700123A001000453Q00123A001100B53Q00123A001200454Q0005000F0012000200100F000E0042000F003020000E00270028001206000F00233Q00202A000F000F001700123A001000303Q00123A001100313Q00123A001200324Q0005000F0012000200100F000E0029000F001206000F00253Q00202A000F000F001700123A001000AB3Q00123A001100AC3Q00123A001200AD4Q0005000F0012000200100F000E002A000F001206000F00253Q00202A000F000F001700123A001000023Q00123A001100773Q00123A001200024Q0005000F0012000200100F000E0046000F001206000F00103Q00202A000F000F004A00202A000F000F004B00100F000E004A000F003020000E0006004C001206000F00103Q00202A000F000F001100202A000F000F001200100F000E002E000F00100F000D0005000E2Q0022000E00014Q0022000F3Q0004003020000F000100B6003020000F0003004E2Q002200103Q0001001206001100103Q00202A00110011004F00202A00110011005000100F0010004F001100100F000F000500102Q002200105Q00100F000F000800102Q002F000E0001000100100F000D0008000E2Q002F00060007000100100F0005000800062Q002F00030002000100100F00020008000300063500033Q000100032Q00083Q00014Q00088Q00083Q00033Q00063500040001000100022Q00083Q00034Q00083Q00024Q001B000400024Q001C3Q00013Q00023Q00103Q0003083Q00496E7374616E63652Q033Q006E657703043Q005479706503023Q004944026Q00F03F027Q00400003053Q007061697273030A3Q0050726F7065727469657303043Q007479706503063Q00737472696E6703083Q00746F6E756D62657203053Q006D61746368030B3Q005E5F523A2825772B295F2403083Q004368696C6472656E03063Q00506172656E7402443Q001206000200013Q00202A00020002000200202A00033Q00032Q002E00020002000200202A00033Q000400060C0003001600013Q0004173Q001600012Q001E00035Q00202A00043Q00042Q000200030003000400060C0003001300013Q0004173Q0013000100202A00040003000500202A0005000300062Q00330004000500022Q001E00045Q00202A00053Q00040020190004000500070004173Q001600012Q001E000400013Q00202A00053Q00042Q0033000400050002001206000300083Q00202A00043Q00092Q00280003000200050004173Q003500010012060008000A6Q000900074Q002E00080002000200260A000800340001000B0004173Q003400010012060008000C3Q00203B00090007000D00123A000B000E4Q00140009000B4Q001100083Q000200060C0008003400013Q0004173Q003400012Q001E000900014Q000200090009000800060C0009002D00013Q0004173Q002D00012Q001E000900014Q00020007000900080004173Q003400012Q001E00096Q0022000A00026Q000B00026Q000C00064Q002F000A000200012Q003300090008000A2Q0009000700074Q00330002000600070006010003001A000100020004173Q001A0001001206000300083Q00202A00043Q000F2Q00280003000200050004173Q003F00012Q001E000800026Q000900076Q000A00024Q002D0008000A00010006010003003B000100020004173Q003B000100100F0002001000012Q001B000200024Q001C3Q00019Q003Q00064Q001E8Q001E000100014Q0009000200024Q001D3Q00024Q00278Q001C3Q00017Q00",v9(),...);