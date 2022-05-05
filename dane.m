syms s;


sb = -15;
G = (s+2)*(s+9)/((s+10)*(s+11)*(s+12));
collect(G);
[A,B,C,D] = tf2ss([0 1 11 18], [1 33 362 1320]);
k1 = -3*sb - 33;
k2 =3*sb^2 -362;
k3 = -sb^3 -1320;
%k = sym('k', [1 3]);
%syms so;
so = -15;
L1 = -(14149*so)/30 - (781*so^2)/15 - (347*so^3)/180 - 130493/90;
L2 = (77*so^3)/360 + (347*so^2)/60 + (781*so)/15 + 14149/90;
L3 = -(347*so)/60 - (77*so^2)/120 - (17*so^3)/720 - 781/45;


Ar = [A zeros(3,1); -1 -11 -18 0];
Br = [1 0 0 0]';
K = acker(Ar, Br, [sb sb sb sb]);
mnoznik = 1.30;
Br = mnoznik*Br;
Er = [0 0 0 1]';
%L = sym('L', [3 1]);
%collect(det(s*eye(3)-A+L*C))
%collect((s-so)^3)
%eqns = [L1 + 11*L2 + 18*L3 + 33 == -3*(so), 11*L1 + 19*L2 - 726*L3 + 362 == 3*(so)^2, 18*L1 - 726*L2 - 8004*L3 + 1320 == -(so)^3];
%solve(eqns, [L1, L2, L3])
%syms sb
%(s-sb)^3;
%det(s*eye(3)-A+B*k)
%plot(out.y2.time, out.y2.signals.values);
%xlabel("Czas");
%ylabel("Wartość sygnału");

%{
print('Tp01.png','-dpng','-r400')
stairs(out.y_d.time, out.y_d.signals.values);
xlabel("Czas");
ylabel("Wartość sygnału");
hold on
stairs(out.y_dl.time, out.y_dl.signals.values);
legend(["Sygnał niezlinearyzowany", "Sygnał zlinearyzowany"],'Location', 'southeast');
%}