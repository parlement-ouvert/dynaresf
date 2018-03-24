// --+ options: stochastic +--

/* © 2017 Stéphane Adjemian <stephane.adjemian@univ-lemans.fr>
 *
 * This file is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * It is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with the file.  If not, see <http://www.gnu.org/licenses/>.
 */

var y1 y2 y3 ;

varexo e1 e2 e3 ;

parameters a11 a12 a13 a21 a22 a23 a31 a32 a33 ;

/*
** Simulate the elements of the first order autoregressive matrix (we impose stability of the model, note that
** inversion fails if the model is explosive, ie the autoregressive matrix has at least one root greater than
** one in modulus) probably because of the propagation of roundoff errors.
*/

D = diag([.9 .7 .8]);
P = randn(3,3);
A = P*D*inv(P);

a11 = A(1,1);
a12 = A(1,2);
a13 = A(1,3);
a21 = A(2,1);
a22 = A(2,2);
a23 = A(2,3);
a31 = A(3,1);
a32 = A(3,2);
a33 = A(3,3);

model(linear);
    y1 = a11*y1(-1) + a12*y2(-1) + a13*y3(-1) + e1 ;
    y2 = a21*y1(-1) + a22*y2(-1) + a23*y3(-1) + e2 ;
    y3 = a31*y1(-1) + a32*y2(-1) + a33*y3(-1) + e3 ;
end;

// Set initial condition.
idata = dseries(zeros(1,3), '1950Q1', cellstr(M_.endo_names));

shocks;
    var e1 = 1.0;
    var e2 = 1.0;
    var e3 = 1.0;
end;

steady;
check;

// Perform the simulation over 20 periods
initialconditions = simul_backward_model(idata, 20);

shocks;
    var e1 = .2;
    var e2 = .2;
    var e3 = .2;
end;

// Define the variables for which we want to compute the forecasts
listofvariables = {'y1', 'y2', 'y3'};

// Compute the forecasts
forecasts = backward_model_forecast(initialconditions, listofvariables, 16, true);

// Plot forecast for output
plot(forecasts.meanforecast.y1, '-k', 'linewidth', 2)
hold on
plot(forecasts.lb.y1,'-r')
plot(forecasts.ub.y1,'-r')
endofsample = find(forecasts.pointforecast.y1.dates==forecasts.start)-1;
plot([endofsample, endofsample], [min(forecasts.lb.y1.data), max(forecasts.lb.y1.data)], '--g')
hold off
