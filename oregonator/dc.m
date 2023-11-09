function dc = dc(t,c)
% Wird von ODE-Funktion aufgerufen. Wenn z.B. ODE15S mit der Option
% 'jacobian','on' ausgef�hrt wird, wird auch die Ableitung
% verwendet (durch Funktionsaufruf mit dem entsprechenden Flag).

      kcu21 = 10.0e2
      kcu22 = 8.3
      km3 = 1.6
      km4 = 40.0
      km5 = 1.5 .* 10.0e-3
      km6 = 0.3
      km7 = 5.0 .* 10.0e2
      km8 = 4.0 .* 10.0e4
      km9 = 40.0
      km18 = 7.0 .* 10.0e4
      km19 = 8.0 .* 10.0e7
      km20 = 1.2 .* 10.0e7
      km21 = 4.0 .* 10.0e4
      km22 = 1.8 .* 10.0e7
      km23 = 4.0 .* 10.0e9
      km24 = 0.2
      k6p = 6.93 .* 10.0e-3
      k8p = 5.0 .* 10.0e4
      k9 = 1.02 .* 10.0e9

      c_oh = 0.045
      rcu21 = kcu21 .* c(15) .* c(1)
      rcu22 = kcu22 .* c(2)
      rm3 = km3 .* c(2) .* c(3)
      rm4 = km4 .* c(4) .* c(4)
      rm5 = km5 .* c(1) .* c(3)
      rm6 = km6 .* c(1) .* c(5)
      rm7 = km7 .* c(6) .* c(6)
      rm8 = km8 .* c(6) .* c(7) .* c_oh
      rm9 = km9 .* c(7) .* c(7) .* c_oh
      rm18 = km18 .* c(8) .* c(7)
      rm19 = km19 .* c(9) .* c(9) .* c_oh
      rm20 = km20 .* c(9) .* c(10) .* c_oh
      rm21 = km21 .* c(8) .* c(4)
      rm22 = km22 .* c(10) .* c(11) .* c_oh
      rm23 = km23 .* c(11) .* c(11) .* c_oh
      rm24 = km24 .* c(1) .* c(14)
      r6p = k6p .* c(2)
      r8p = k8p .* c(1) .* c(12)
      r9 =  c(1) .* c(13) .* k9

      dc = [0.0;0.0;0.0;0.0;0.0;0.0;0.0;0.0;0.0;0.0;0.0;0.0;0.0;0.0;0.0]
      dc(1) = -rcu21 + rcu22 - rm5 - rm6 - rm24 - r8p - r9
      dc(2) = rcu21 - rcu22 - rm3
      dc(3) = -2.0 .* rm3 - rm5 + 2.0 .* rm20 + 2.0 .* rm22
      dc(4) = rm3 - 2.0 .* rm4 - rm21 + rm9 + r6p
      dc(5) = rm5 - rm6 + rm7 + rm8
      dc(6) = rm6 - 2.0 .* rm7 - rm8
      dc(7) = rm7 - rm8 - 2.0 .* rm9 - rm18 + rm19
      dc(8) = rm9 - rm18 + rm19 + rm20 - rm21
      dc(9) = 2.0 .* rm18 - 2.0 .* rm19 - rm20
      dc(10) = rm3 - rm20 - rm22
      dc(11) = rm21 - rm22 - rm23
      dc(12) = r6p - r8p
      dc(13) = r8p - r9
      dc(14) = rm22 + rm23 - rm24
      dc(15) = -rcu21 + rcu22 + rm20 + r8p
      if dc(15) > 0.00009
        error()
      endif
end


