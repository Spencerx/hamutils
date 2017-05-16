hamutils
========

Some ham radio utilities.  Can be run from the command line or for use by an
IRC bot.  Licensed under 2-clause BSD license.

## qrz

qrz scrapes the qrz.com web page for information on a ham radio callsign.
qrz.com requires a login to get any detail, so the script mandates a login as
well.

### $HOME/.qrzlogin

Place the following lines in a $HOME/.qrzlogin file.

```
$login_callsign="YOURCALL";
$login_password="yourpass";
$mylat=38.897646;
$mylon=-77.03648;
```

### example use

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

## grid

grid will map grid squares to place names and place names to grid squares.  It
can use the $mylat and $mylon values in the $HOME/.qrzlogin file as well to
provide an origin for distance calculations.  Also, an origin may be specified
on the command line using the 'from' or 'de' keywords.

### example use

```
$ grid tokyo, japan
PM95ur: 35.7090259, 139.7319925: Bunkyo, Tokyo, Japan -- 10911.8 km, 331° from FM18lv

$ grid  東京日本
PM95vq: 35.6813820, 139.7660840: Chiyoda, Tokyo, Japan -- 10913.1 km, 331° from FM18lv

$ grid JO22wa
JO22wa: 52.0208, 5.8750: Arnhem, Netherlands -- 6273.8 km, 47° from FM18lv

$ grid 1600 Pennsylvania Ave NW, Washington, DC 20500
FM18lv: 38.8987352, -77.0350902: Northwest Washington, Washington, DC, USA -- 0.0 km, 0° from FM18lv

$ grid 52.000,0.000
JO02aa: 52.000, 0.000: North Hertfordshire District, Hertfordshire, UK -- 5895.8 km, 49° from FM18lv

$ grid newark, nj from bombay, india
FN20vr: 40.7356570, -74.1723667: Central Business District, Newark, NJ, USA -- 12557.7 km, 333° from MK69kb

$ grid IO92vw de FN20rs
IO92vw: 52.9375, -0.2083: Boston, Lincolnshire, UK -- 5552.8 km, 49° from FN20rs
```

## lotwreportcheck

Compare LoTW last known upload date with your ADIF log files and lotw QSL
report.  Produces report of QSOs which should be confirmed, but are not.

A QSO is considered "should be confirmed" if it is in your log, and the remote
station has a known LoTW upload date that is more recent than your log, and if
there is no QSL record in the LoTW report.

### LoTW report

Retreive your LoTW report from here, after editing ``YOURCALL`` and
``YOURPASS`` to match your account:
https://lotw.arrl.org/lotwuser/lotwreport.adi?login=YOURCALL&password=YOURPASS&qso_query=1&qso_qsl=yes&qso_qsldetail=yes&qso_startdate=1950-01-01

The file downloaded will be "lotwreport.adi".  Use this as the first
parameter to lotwreportcheck.

Last known LoTW upload date is maintained in a list compiled by WD5EAE.  wget
is required to retrieve it.  Source: http://www.wd5eae.org/LoTW_Data.txt

### Known bugs
- only checks one QSO per date
- assumes ADIF log files are with one QSO per line like those produced by
  fldigi, WSJT-X, and xlog. LoTW report ADIF is handled separately.

### Example use

```
$ lotwreportcheck lotwreport.adi ~/.wsjtx/*adi
missing: EA7AHG qso: 20140421   last upload: 20140725
missing: EI1DG  qso: 20140507   last upload: 20140731
missing: K0GDI  qso: 20140518   last upload: 20140706
missing: KC0CDM qso: 20140719   last upload: 20140807
missing: KC8NN  qso: 20140418   last upload: 20140805
missing: PA3FUJ qso: 20140518   last upload: 20140722
missing: RA2FIA qso: 20140424   last upload: 20140718
missing: SV2DFK qso: 20140425   last upload: 20140630
missing: ZS6WN  qso: 20140425   last upload: 20140731
```

## dxcc

Get information about the DXCC entity of a callsign or prefix.  Uses
``cty.dat`` file for DXCC information, which is the same format used by tools
like fldigi and xlog.  Retrieve the file from
[country-files.com](http://www.country-files.com/).  I prefer the [Big
CTY](http://www.country-files.com/big-cty/) version, which can be downloaded
[here](http://www.country-files.com/category/big-cty/).

### cty.dat placement

The default location to look for cty.dat is ``$HOME/.cty.dat`` (a hidden
dotfile).  This can be made a symlink to your fldigi or xlog directory, or
another similar location.

### Clublog most-wanted rank

Clublog most-wanted rank can be scraped using the ``mostwanted-scrape.sh``
script.  It will create a file with ranking information in
``$HOME/.mostwanted.txt``.  The source of the ranking is the list here:
https://secure.clublog.org/mostwanted.php

### Example use

```
$ dxcc KC4AAA
KC4AAA: Antarctica (CE9): SA CQ:39 ITU:74 MW:225
$ dxcc W1AW
W1AW: United States (K): NA CQ:5 ITU:8 MW:340
$ dxcc UA9YY
UA9YY: Asiatic Russia (UA9): AS CQ:18 ITU:31 MW:325
$ dxcc UA9XX
UA9XX: European Russia (UA): EU CQ:17 ITU:20 MW:337
$ dxcc VP8
VP8: Falkland Islands: SA CQ:13 ITU:16 MW:186
$ dxcc wallis
FW: Wallis & Futuna Islands: OC CQ:32 ITU:62 MW:71
$ dxcc willis
VK9W: Willis Island: OC CQ:30 ITU:55 MW:34
```

### Possible future enhancements

* provide range to DXCC based on user latitude/longitude
* provide local time at the DXCC location
* provide sunrise/sunset at the DXCC location

