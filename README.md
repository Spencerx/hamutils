hamutils
========

Some ham radio utilities.  Can be run from the command line or for use by an
IRC bot.

##qrz

qrz scrapes the qrz.com web page for information on a ham radio callsign.
qrz.com requires a login to get any detail, so the script mandates a login as
well.

###$HOME/.qrzlogin

Place the following lines in a $HOME/.qrzlogin file.

```
$login_callsign="YOURCALL";
$login_password="yourpass";
$mylat=38.897646;
$mylon=-77.03648;
```

###example use

```
$ qrz w1aw
W1AW: USA: ARRL HQ OPERATORS CLUB -- W1AW@ARRL.ORG -- Club class -- codes: HAB (club) -- QSL: LEM
225 MAIN ST; NEWINGTON, CT 06111; USA
FN31pr 41.714775, -72.727260 [src: user] -- 481.7 km, 48° from FM18lv

$ qrz john smith
john smith: possible matches:
2E0HDK: graham john smith st helens   
2M0HJS: John Smith Portknockie   
2W0BVS: John Smith PORT TALBOT   
AB4QE: JOHN R SMITH BANKSTON AL  
truncated. 219 matches found. see http://www.qrz.com/lookup/?query=john%20smith&mode=name

$ qrz FN20xr
FN20xr matches:
AA2SJ: JOSE L MORALES Union City NJ FN20xr 
AA2SO: JOHN L MC NAIR JERSEY CITY NJ FN20xr 
AA2UJ: MICHAEL S MARMOR Baltimore MD FN20xr 
AB2RM: Peter C Westall Brooklyn, NY NY FN20xr 
truncated. 184 matches found. see http://www.qrz.com/lookup/?query=FN20xr&mode=grid

$ qrz palo alto ca
palo alto ca: possible matches:
AA6EX: Allen P Edwards Palo Alto CA  
AA6HQ: LAWRENCE G DESMOND PALO ALTO CA  
AA6LS: STEPHEN S SAPERSTEIN PALO ALTO CA  
AA6OO: Christopher W Scarborough Palo Alto CA  
truncated. 653 matches found. see http://www.qrz.com/lookup/?query=palo%20alto%20ca&mode=name

$ qrz 'W*AW'
WP4FAW: JOSE M DEL TORO HORMIGUEROS PR  
WB9NAW: James W Ensinger Buffalo Grove IL  
W8DAW: David A Wengrow Canton MI  
WB3GAW: JOHN M KINNAMAN, JR PEN ARGYL PA  
truncated. 313 matches found. see http://www.qrz.com/lookup/?query=W%2AAW&mode=callsign
```

##grid

grid will map grid squares to place names and place names to grid squares.  It
can use the $mylat and $mylon values in the $HOME/.qrzlogin file as well.

###example use

```
$ grid tokyo, japan
PM95uq: 35.6894875, 139.6917064: Shinjuku, Tokyo, Japan -- 10916.4 km, 331° from FM18lv

$ grid  東京日本
PM95uq: 35.6894875, 139.6917064: Shinjuku, Tokyo, Japan -- 10916.4 km, 331° from FM18lv

$ grid JO22wa
JO22wa: 52.0208, 5.8750: Arnhem, The Netherlands -- 6273.3 km, 47° from FM18lv

$ grid 1600 Pennsylvania Ave NW, Washington, DC 20500
FM18lv: 38.8978378, -77.0365123: Washington, DC, USA -- 0.0 km, 353° from FM18lv

$ grid 52.000,0.000
JO02aa: 52.000, 0.000: North Hertfordshire District, Hertfordshire, UK -- 5896.0 km, 49° from FM18lv
```
