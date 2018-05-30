// --+ options: stochastic +--

var ct,it,yt,expt,dt;           // variables endogènes
varexo eg;                      // variables exogènes
parameters
b,c,is,r,g,pi                   // paramètres structurels - généraux
gb,tau,lamb,ds,rhog;            // paramètres structurels - finances publiques

b    = 1.05;                    // sensibilité de l'investissement au cycle économique
is   = 0.15;                    // part fixe de l'investissement
r    = 0.04;                    // taux d'intérêt
g    = 0.013;                   // taux de croissance
pi   = 0.02;                    // taux d'inflation

ds   = 0.6;                     // cible de dette publique en % du PIB
lamb = 0.02;                    // dynamique des dépenses publiques
tau  = 0.5;                     // recettes publiques en % du PIB
rhog = 0.9;                     // persistance des dépenses publiques

gb   = tau-(r-g-pi)*ds;         // contrainte budgétaire de long-terme
c    = (1-is-gb)/(1-tau);       // consommation privée (on impose le PIB à 1)

model;
ct   = c*(1-tau)*yt(-1);
it   = b*(ct-ct(-1))+is;
yt   = ct+it+expt;
expt = rhog*expt(-1)+(1-rhog)*gb-lamb*(dt-ds)+eg;
dt   = (1+r-g-pi)*dt(-1)+expt-tau;
end;

steady;
check;

datafipu = dseries('data.csv');

initdata = dseries([datafipu{'debt_gdp'}.data(end), datafipu{'expenditures_gdp'}.data(end), 1, 1-is-datafipu{'expenditures_gdp'}.data(end), is], datafipu.last+1, {'dt'; 'expt'; 'yt'; 'ct'; 'it'});
SimulData = simul_backward_model(initdata, 40);
plot(SimulData.dt, '-k')
