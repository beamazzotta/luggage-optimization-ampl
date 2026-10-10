

set AMICI;
set AUTO_FISSE;
param valore {AMICI}; param volume {AMICI};
param capacita {AUTO_FISSE};
param cap_terza := 200; param costo_terza; 

var x {AMICI, AUTO_FISSE} binary;
var x3 {AMICI} binary;
var y binary;

maximize Profitto: sum{i in AMICI, j in AUTO_FISSE} valore[i]*x[i,j] + sum{i in
AMICI} valore[i]*x3[i] - costo_terza*y;

s.t. Cap_Fisse {j in AUTO_FISSE}: sum{i in AMICI} volume[i]*x[i,j] <= capacita[j];
s.t. Cap_Terza: sum{i in AMICI} volume[i]*x3[i] <= cap_terza * y;
s.t. Assegnazione {i in AMICI}: sum{j in AUTO_FISSE} x[i,j] + x3[i] <= 1;
s.t. Min_Borse: sum{i in AMICI, j in AUTO_FISSE} x[i,j] + sum{i in AMICI} x3[i] >=
4;

