syms s;


sb = -0.2;
G = (s+2)*(s+9)/((s+10)*(s+11)*(s+12));
collect(G)
[A,B,C,D] = tf2ss([1 11 18], [1 33 362 1320]);
k1 = -3*sb - 33;
k2 =3*sb^2 -362;
k3 = -sb^3 -1320;
k = sym('k', [1 3]);
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