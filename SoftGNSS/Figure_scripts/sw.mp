\verbatimtex
\documentclass{article}
\usepackage{times}
\usepackage[mtbold]{mathtime}
\usepackage{bm,amsmath,amssymb}
\def\stk#1#2{\begin{tabular}{l} #1\\#2\end{tabular}}
\def\bigupdownstrut{\vrule height 2.5\ht\strutbox depth 3\dp\strutbox width0pt}
\def\Bigupdownstrut{\vrule height 10\ht\strutbox depth 40\dp\strutbox width0pt}
\begin{document}
etex

def Arrow(expr Position, Theta) =
   begingroup;
      path p;
      p = (0,0)--(-1,2)--(5,0)--(-1,-2)--cycle;
      fill p rotated Theta shifted Position;
   endgroup
enddef;

marksize=4pt;

def draw_mark(expr p, a) =
     begingroup
     save t, dm; pair dm;
     t = arctime a of p;
     dm = marksize*unitvector direction t of p
    rotated 90;
     draw (-.5dm.. .5dm) shifted point t of p;
     endgroup
enddef;

def draw_marked(expr p, n) =
    begingroup
    save amid;
    amid = .5*arclength p;
    for i=-(n-1)/2 upto (n-1)/2:
       drawmark(p, amid+.6marksize*i);
    endfor
    draw p;
    endgroup
enddef;

angle_radius=8pt;

def mark_angle(expr a, b, c, n) =
    begingroup
    save s, p; path p;
    p = unitvector(a-b){(a-b)rotated 90}..unitvector(c-b);
    s = .9marksize/length(point 1 of p - point 0 of p);
    if s<angle_radius: s:=angle_radius; fi
    draw_marked(p scaled s shifted b, n);
    endgroup
enddef;

def mark_rt_angle(expr a, b, c) =
   draw ((1,0)--(1,1)--(0,1))
      zscaled (4pt*unitvector(a-b)) shifted b
enddef;

def draw_angle(expr a, b, c, s) =
    begingroup
    path p;
    p = unitvector(a-b){(a-b)rotated 90}..unitvector(c-b);
    draw p scaled s shifted b;
    endgroup
enddef;

def Angle(expr apex, alphab, alphae, radius) =
    begingroup
    path p;
    p = fullcircle; % length of p is 8
    draw subpath (alphab/45,alphae/45) of p scaled radius shifted apex;
    endgroup
enddef;

labeloffset:=6bp;

u=1cm;

beginfig(1);
z0=(0,0);
z1=(-3u,0);
z2=(4u,0);
z3=(0,4u);
z4=(2u,0);
z5=(2u,3u);
z6=(-2u,3u);
z7=(-2u,0);
draw z1--z2; Arrow(z2,0);
draw z0..z3; Arrow(z3,90);
pickup pencircle scaled 1pt;
draw z4--z5--z6--z7;
pickup pencircle scaled .4pt;
label.llft(btex time $t$ etex, z2);
label.llft(btex $f(t)$ etex, z3);
label.rt(btex $(T/2,1)$ etex, z5);
label.bot(btex $T/2$ etex, z4);
label.bot(btex $-T/2$ etex, z7);
label.lft(btex $(-T/2,1)$ etex, z6);
endfig;

beginfig(2);
z0=(2u,0);
z1=(0,2u);
z2=(-2u,0);
z3=(-2.5u,0);
z4=(3u,0);
z5=(0,-.8u);
z6=(0,3u);
draw z3--z4; Arrow(z4,0);
draw z5--z6; Arrow(z6,90);
label.llft(btex $r_f(\tau)$ etex, z6);
label.llft(btex $\tau$ etex, z4);
label.bot(btex $T$ etex, z0);
label.bot(btex $-T$ etex, z2);
label.rt(btex $(0,T)$ etex, z1);
pickup pencircle scaled 1pt;
draw z0--z1--z2;
pickup pencircle scaled .4pt;
endfig;

beginfig(3);
z0=(2u,0);
z1=(0,2u);
z2=(-2u,0);
z3=(-2.5u,0);
z4=(3u,0);
z5=(0,-.8u);
z6=(0,3u);
draw z3--z4; Arrow(z4,0);
draw z5--z6; Arrow(z6,90);
label.llft(btex $r_X(\tau)$ etex, z6);
label.llft(btex $\tau$ etex, z4);
label.bot(btex $T$ etex, z0);
label.bot(btex $-T$ etex, z2);
label.rt(btex $(0,1)$ etex, z1);
pickup pencircle scaled 1pt;
draw z0--z1--z2;
pickup pencircle scaled .4pt;
endfig;

beginfig(4);
z0=(0,0);
z1=(-3u,0);
z2=(3u,0);
z3=(0,-3u);
z4=(0,3u);
z5=(1.9u,.6245u);
z6=(-1.9u,-.6245u);
z7=(2.17u,0);
z8=(0,2.17u);
z9=(-2.17u,0);
z10=(0,-2.17u);
draw z7..z8..z9..z10..cycle;
draw z1--z2; Arrow(z2,0);
draw z3--z4; Arrow(z4,90);
label.llft(btex $I$ etex, z2);
label.llft(btex $Q$ etex, z4);
pickup pencircle scaled 1pt;
draw z0--z5; Arrow(z5,18.19);
draw z0--z6 dashed evenly scaled 2; Arrow(z6,198.19);
pickup pencircle scaled .4pt;
mark_angle(z2,z0,z5,0);
label.rt(btex $\varphi$ etex, (.7u,.15u));
mark_angle(z1,z0,z6,0);
label.lft(btex $\varphi$ etex, (-.7u,-.2u));
endfig;

beginfig(5);
z0 = (0,0);
z1 = (0,1u);
z2 = (0,2u);
z3 = (0,3u);
z4 = (3u,3u);
z5 = (3u,2u);
z6 = (3u,1u);
z7 = (.5u,3u);
z8 = (1u,2u);
z9 = (1.5u,1u);
z10 = (.5u,0);
z11 = (1u,0);
z12 = (1.5u,0);
z13 = (3u,0);
z14 = (3.6u,0);
z15 = (3.6u,1u);
z16 = (3.6u,2u);
z17 = (3.6u,3u);
z18 = (5u,3u);
z19 = (5u,2.5u);
z20 = (5u,2u);
z21 = (5u,1u);
z22 = (5u,.5u);
z23 = (5u,0);
z24 = (6u,-0.5u);
z25 = (6u,.5u);
z26 = (6u,2.5u);
z27 = (6u,3.5u);
z28 = (6.5u,2.5u);
z29 = (6.5u,1.5u);
z30 = (6.5u,.5u);
z31 = (8u,1.5u);
label.rt(btex L1 OS, data etex, (-2u,3u));
label.rt(btex L1 OS, pilot etex, (-2u,2u));
label.rt(btex L1 PRS etex, (-2u,1u));
%label.rt(btex L1Int etex, (-2u,0));
draw z3--z4;
draw z2--z5;
draw z1--z6;
draw z7--z10--z13;
draw z8--z11;
draw z9--z12;
path p[];
p1 = (-1u,-1.5u)--(2u,0)--(-1u,1.5u)--(-1u,-1.5u);
p2 = p1 scaled 0.2 shifted (3.2u,3u);
draw p2;
p3 = p1 scaled 0.2 shifted (3.2u,2u);
draw p3;
p4 = p1 scaled 0.2 shifted (3.2u,1u);
draw p4;
p5 = p1 scaled 0.2 shifted (3.2u,0);
draw p5;
draw z17--z18;
draw z16--z20--z18;
draw z15--z21--z23--z14;
draw z19--z28--z29--z31;
draw z22--z30--z29;
label(btex $\bigoplus$ etex, z19); 
label(btex $\bigoplus$ etex, z22);
label(btex $\bigoplus$ etex, z29);
label.rt(btex $\alpha$ etex, (2.9u,3u));
label.rt(btex $\alpha$ etex, (2.9u,2u));
label.rt(btex $\beta$ etex, (2.9u,.95u));
label.rt(btex $\gamma$ etex, (2.9u,0));
label.ulft(btex $e_B(t)$ etex, z4);
label.ulft(btex $e_C(t)$ etex, z5);
label.ulft(btex $e_A(t)$ etex, z6);
label.ulft(btex $e_Ae_Be_C$ etex, z13);
label.top(btex $\cos(2\pi f_1 t)$ etex, z27);
label.bot(btex $\sin(2\pi f_1t)$ etex, z24);
draw z24--z25;
draw z26--z27;

path a;
a = fullcircle scaled 3.2mm;
fill a shifted (1u,0) withcolor 1white;
fill a shifted (1.5u,0) withcolor 1white;
fill a shifted (6u,.5u) withcolor 1white;
fill a shifted (6u,2.5u) withcolor 1white;

label(btex $\bigotimes$ etex, z11);
label(btex $\bigotimes$ etex, z12);
label(btex $\bigotimes$ etex, z25);
label(btex $\bigotimes$ etex, z26);
Arrow(z31,0);
label.ulft(btex $+$ etex, z19);
label.llft(btex $-$ etex, z19);
label.ulft(btex $+$ etex, z22);
label.llft(btex $+$ etex, z22);
label.ulft(btex $+$ etex, z29);
label.llft(btex $-$ etex, z29);
label.llft(btex $S(t)$ etex, z31);
endfig;


input boxes

beginfig(6);
boxit.sk(btex \strut \hskip 42.75mm superframe \# $k$\hskip 42.75mm etex);
drawboxed(sk);
interim defaultdy:=7bp;
label.rt(btex \strut superframe \# $(k+1)$ etex, sk.e);
draw sk.ne--sk.ne+(32mm,0mm);
draw sk.se--sk.se+(32mm,0mm);
%
boxjoin(a.se=b.sw; a.ne=b.nw);
boxit.f1(btex \strut frame \# $1$ etex);
boxit.c1(btex \strut $\cdots$ etex);
boxit.i1(btex \strut frame \# $(i-1)$ etex);
boxit.i(btex \strut frame \# $i$ etex);
boxit.i2(btex \strut frame \# $(i+1)$ etex);
boxit.c2(btex \strut $\cdots$ etex);
boxit.n(btex \strut frame \# $N$ etex);
boxit.f2(btex \strut frame \# $1$ etex);
sk.sw=f1.nw+(0bp,40bp);
drawboxed(i1,f1,c1,i,i2,c2,n,f2);
interim defaultdy:=7bp;
label.rt(btex \strut $\cdots$ etex, f2.e);
draw f2.ne--f2.ne+(10mm,0mm);
draw f2.se--f2.se+(10mm,0mm);
%
boxjoin(a.se=b.sw; a.ne=b.nw);
boxit.sf1(btex \strut subframe \# $1$ etex);
boxit.sc1(btex \strut $\cdots$ etex);
boxit.si1(btex \strut subframe \# $(j-1)$ etex);
boxit.si(btex \strut subframe \# $j$ etex);
boxit.si2(btex \strut subframe \# $(j+1)$ etex);
boxit.sc2(btex \strut $\cdots$ etex);
boxit.sn(btex \strut subframe \# $P$ etex);
f1.sw=sf1.nw+(0bp,40bp);
drawboxed(si1,sf1,sc1,si,si2,sc2,sn);
interim defaultdy:=7bp; 
%
boxjoin(a.se=b.sw; a.ne=b.nw);
boxit.tsf1(btex \strut SW etex);
boxit.tsc1(btex \strut \hskip 10mm Data field\hskip 10mm etex);
boxit.tsi1(btex \strut CRC etex);
boxit.tsi(btex \strut Tail bits etex);
sf1.sw=tsf1.nw+(-100bp,40bp);
drawboxed(tsi1,tsf1,tsc1,tsi);
interim defaultdy:=7bp; 
draw sk.sw--f1.nw;
draw sk.se--n.ne;
draw i.sw--sf1.nw;
draw i.se--sn.ne;
draw si.sw--tsf1nw;
draw si.se--tsi.ne;
z0=tsf1.se-(0bp,10bp);
z1=tsi.se-(0bp,10bp);
drawdblarrow z0--z1;
label(btex FEC encoded, then block-interleaved etex, .5[z0-(0,10bp),z1-(0bp,10bp)]);
endfig;

beginfig(7); % Notation for data
z0 = (0,0);
z1 = (6u,0);
z2 = (0,2u);
z3 = (6u,2u);
draw z0--z1--z3--z2--cycle;
label.lrt(btex MSB etex, z0);
label.ulft(btex LSB etex, z0);
label.llft(btex MSB etex, z2);
label.llft(btex LSB etex, z1);
label.lft(btex \begin{tabular}{c} Direction of data\\flow from SV\end{tabular} etex, (-1u,1u));
label.top(btex Direction of data flow from SV etex, (3u,2.5u));
label(btex Data etex,(0.7u,1.75u));
label(btex Data etex,(3.8u,1.75u));
label(btex Data etex,(3.1u,1.25u));
label(btex Data etex,(2u,.75u));
label(btex Data etex,(5.1u,.75u));
label(btex Data etex, (3.1u,.25u));
drawarrow (-1.1u,0)--(-1.1u,2u);
drawarrow z3+(0,0.5u)--z2+(0,0.5u);
draw (0,0.5u)--(6u,0.5u);
draw (0,1u)--(6u,1u);
draw (0,1.5u)--(6u,1.5u);
draw (4u,0.5u)--(4u,1u);
draw (1.5u,1.5u)--(1.5u,2u);
endfig;

beginfig(8); % Dennis' front-end
labeloffset:=10bp; %6b
z0 = (0,3u);
z1 = (0,5u);
z2 = (1u,3u);
z3 = (2.5u,3u);
z4 = (4.5u,3u);
z5 = (6u,3u);
z6 = (7.5u,3u);
z7 = (9u,3u);
z8 = (11u,3u);
z9 = (12.5u,3u);
z10 = (12.5u,2u);
z11 = (11u,0); %1u
z12 = (8u,0);
z13 = (4.5u,0);
z14 = (4.5u,-.5u);
z15 = (2.5u,-.5u);
label.top(btex \small\begin{tabular}{c} Active antenna\\ $\text{Gain}\approx 30\,$dB\\
                                  $\text{Noise figure} \approx 2.5\,$dB\end{tabular} etex, z1);
label.lft(btex \small\begin{tabular}{c} Rooftop cable\\Loss $\approx$ 8.0\,dB\end{tabular} etex, 0.5[z0,z1]);
label.bot(btex \small\begin{tabular}{c} Bandpass filter\\$f_{\text{center}} = 1\,575.42$\,MHz\\
                                    $3\,\text{dB BW}\approx 50$\,MHz \end{tabular} etex, z2);
label.top(btex \small\begin{tabular}{c} Amplifier(s)\\$\text{Gain} \approx 50\,$dB\\
                                                  $\text{Noise figure} \approx 4.0\,$dB\end{tabular} etex, z3);
label.top(btex \small\begin{tabular}{c} Amplifier(s)\\ $\text{Gain} \approx 50\,$dB\\
                                                     $\text{Noise figure} \approx 4.0\,$dB\end{tabular} etex, z6);
label.top(btex \small\begin{tabular}{c} Analog-to-digital\\converter\\ $f_{\text{sampling}} \approx 38.192\,$MHz\\
                                            4-bit samples\end{tabular} etex, z8);
label.bot(btex \small\begin{tabular}{c} Bandpass filter\\ $f_{\text{center}} = 47.74$\,MHz\\ 
                                                         $3\,\text{dB BW} \approx 6.0\,$MHz\end{tabular} etex, z7);
label.bot(btex \small\begin{tabular}{c} Sampled signal\\to be processed\\IF = 9.548\,MHz\end{tabular} etex, z10);
label.bot(btex \small\begin{tabular}{c} Sampling\\ clock\end{tabular} etex,.5[z11,z12]);
label.lft(btex \small\begin{tabular}{c} TCXO\\ $f=10.00$\,MHz\end{tabular} etex, z15);
label.bot(btex \small\begin{tabular}{c} Bandpass filter\\ 
                $f_{\text{center}} = 47.74$\,MHz\\$3\,\text{dB BW}\approx 18\,\text{MHz}$\end{tabular} etex, z5);
label.bot(btex \small\begin{tabular}{c} PLL output\\ 
                       $f = 1\,527.68$\,MHz\\ @ 7\,dBm\end{tabular} etex, z14);

label(btex $\bigotimes$ etex, z4);
label(btex \framebox{$\div 40$} etex,z12);
label(btex $\sim $ etex, z15);

path a, b;
a = fullcircle scaled .4u; 
b = a shifted (2.5u,-.5u);
draw b;
path p[];
p1 = (-1u,-1.5u)--(2u,0)--(-1u,1.5u)--(-1u,-1.5u);
p2 = p1 scaled 0.2 shifted (2.5u,3u);
draw p2;
p3 = p1 scaled 0.2 shifted (7.5u,3u);
draw p3;
p4 = p1 scaled 0.15 rotated -90 shifted (0,5u);
draw p4;

label(btex \framebox{BPF} etex,z5);
label(btex \framebox{BPF} etex,z7);
label(btex \framebox{ADC} etex,z8);
label(btex \framebox{BPF} etex, z2);
label(btex \framebox{PLL} etex, z14);
draw z0--z1+(0,0.15u);
draw z0--(.5u,3u); Arrow((.4u,3u),0);
draw (1.5u,3u)--(2.3u,3u); Arrow((2.1u,3u),0);
draw (2.9u,3u)--(4.3u,3u); Arrow((4.1u,3u),0);
draw (4.5u,-.28u)--(4.5u,2.8u); Arrow((4.5u,2.6u),90);
draw (2.7u,-.5u)--(4u,-.5u); Arrow((3.9u,-.5u),0);
draw z13--(7.5u,0); Arrow((7.4u,0),0);
draw z11--(11u,2.7u); Arrow((11u,2.6u),90);
draw (8.4u,0)--z11;
draw (4.65u,3u)--(5.6u,3u); Arrow((5.35u,3u),0);
draw (6.4u,3u)--(7.3u,3u); Arrow((7.1u,3u),0);
draw (7.9u,3u)--(8.5u,3u); Arrow((8.4u,3u),0);
draw (9.4u,3u)--(10.5u,3u); Arrow((10.3u,3u),0);
draw (11.5u,3u)---z9;
draw z9--z10;  Arrow(z10,-90);
endfig;

beginfig(9); % Comparison of bandpass filters, Fig 4.3
z0 = (0,0);
z1 = (9u,0);
z2 = (0,6u);
z3 = (0,4.5u);
z4 = (0,4.1u);
z5 = (0,3.3u);
z6 = (3u,0);
z7 = (3u,4.5u);
z8 = (6u,4.5u);
z9 = (6u,0);
z10 = (4.5u,4.1u);
z11 = (3u,3.3u);
z12 = (6u,3.3u);
draw z0--z1;
draw z0--z2;
draw z5--(3u,3.3u);
draw z4--z10;
draw z3--z7;
pickup pencircle scaled 1pt;
draw z6--z7--z8--z9;
pickup pencircle scaled .7pt;
label.rt(btex Insertion loss etex, .5[z3,z4]);
label.lft(btex $0$\,dB etex,z3);
label.lft(btex $-1$\,dB etex,z4);
label.lft(btex $-3$\,dB etex,z5); 
label.urt(btex Ideal filter etex, z8);
label.bot(btex $f_{\text{center}}$ etex, (4.7u,0));
draw (0.5u,0.6u)..(1.5u,1.1u)..z11..(3.2u,3.8u)..z10..(5.8u,3.8u)..z12..(7.5u,1.1u)..(8.5u,0.6u) dashed evenly; 
label.rt(btex Less frequency selective etex, (7.5u,1u));
draw (1.8u,0.3u)..(2.3u,.8u)..z11..(3.2u,3.85u)..z10..(5.8u,3.85u)..z12..(6.7u,.8u)..(7.2u,0.3u) 
         dashed evenly scaled 2; 
label.rt(btex More frequency selective etex, (7.2u,.3u));
endfig;

beginfig(10); % Fig 3.9 Viterbi convolutional coding scheme
z0 = (1.5u,0);
z1 = (3u,0);
z2 = (4.5u,0);
z3 = (6u,0);
z4 = (7.5u,0);
z5 = (9u,0);
z6 = (10.5u,0);
z7 = (1.5u,3u);
z8 = (3u,3u);
z9 = (4.5u,3u);
z10 = (6u,3u);
z11 = (7.5u,3u);
z12 = (9u,3u);
z13 = (10.5u,3u);
z14 = (2.25u,1.5u);
z15 = (3.75u,1.5u);
z16 = (5.25u,1.5u);
z17 = (6.75u,1.5u);
z18 = (8.25u,1.5u);
z19 = (9.75u,1.5u);
label(btex $\bigoplus$ etex, z0);
label(btex $\bigoplus$ etex, z1);
label(btex $\bigoplus$ etex, z2);
label(btex $\bigoplus$ etex, z3);
label(btex $\bigoplus$ etex, z4);
label(btex $\bigoplus$ etex, z5);
label(btex $\bigoplus$ etex, z6);
label(btex $\bigoplus$ etex, z7);
label(btex $\bigoplus$ etex, z8);
label(btex $\bigoplus$ etex, z9);
label(btex $\bigoplus$ etex, z10);
label(btex $\bigoplus$ etex, z11);
label(btex $\bigoplus$ etex, z12);
label(btex $\bigoplus$ etex, z13);
label(btex $\framebox{D}$ etex, z14);
label(btex $\framebox{D}$ etex, z15);
label(btex $\framebox{D}$ etex, z16);
label(btex $\framebox{D}$ etex, z17);
label(btex $\framebox{D}$ etex, z18);
label(btex $\framebox{D}$ etex, z19);
draw (1u,1.5u)--(2u,1.5u); Arrow((1.8u,1.5u),0);
draw (2.5u,1.5u)--(3.5u,1.5u); Arrow((3.3u,1.5u),0);
draw (4u,1.5u)--(5u,1.5u); Arrow((4.8u,1.5u),0);
draw (5.5u,1.5u)--(6.5u,1.5u); Arrow((6.3u,1.5u),0);
draw (7u,1.5u)--(8u,1.5u); Arrow((7.8u,1.5u),0);
draw (8.5u,1.5u)--(9.5u,1.5u); Arrow((9.3u,1.5u),0);
draw (10u,1.5u)--(10.5u,1.5u); 

draw (1.7u,0)--(2.8u,0); Arrow((2.6u,0),0);
draw (3.2u,0)--(4.3u,0); Arrow((4.1u,0),0);
draw (4.7u,0)--(5.8u,0); Arrow((5.6u,0),0);
draw (6.2u,0)--(7.3u,0); Arrow((7.1u,0),0);
draw (7.7u,0)--(8.8u,0); Arrow((8.6u,0),0);
draw (9.2u,0)--(10.3u,0); Arrow((10.1u,0),0);
draw (10.7u,0)--(11.8u,0); Arrow((11.6u,0),0);

draw (1.7u,3u)--(2.8u,3u); Arrow((2.6u,3u),0);
draw (3.2u,3u)--(4.3u,3u); Arrow((4.1u,3u),0);
draw (4.7u,3u)--(5.8u,3u); Arrow((5.6u,3u),0);
draw (6.2u,3u)--(7.3u,3u); Arrow((7.1u,3u),0);
draw (7.7u,3u)--(8.8u,3u); Arrow((8.6u,3u),0);
draw (9.2u,3u)--(10.3u,3u); Arrow((10.1u,3u),0);
draw (10.7u,3u)--(11.8u,3u); Arrow((11.6u,3u),0);

draw (1.5u,0.2u)--(1.5u,2.8u); Arrow((1.5u,0.4u),-90); Arrow((1.5u,2.6u),90);
draw (4.5u,0.2u)--(4.5u,2.8u); Arrow((4.5u,0.4u),-90); Arrow((4.5u,2.6u),90);
draw (6u,0.2u)--(6u,2.8u); Arrow((6u,0.4u),-90); Arrow((6u,2.6u),90);
draw (10.5u,0.2u)--(10.5u,2.8u); Arrow((10.5u,0.4u),-90); Arrow((10.5u,2.6u),90);

draw (3u,1.5u)--(3u,2.8u); Arrow((3u,2.6u),90); 
draw (9u,1.5u)--(9u,0.2u); Arrow((9u,0.4u),-90);

label(btex Input etex, (0,1.5u));
label(btex $G_2$ etex, (12.5u,0));
label(btex $G_1$ etex, (12.5u,3u));
endfig;


beginfig(11);  % time sampling
path a, b, c, p[];
z0 = (0,1u);
z1 = (2u,2.5u);
z2 = (4u,3.5u);
z3 = (6u,3.5u);
z4 = (8u,3.2u);
a = z0..z1..z2..z3..z4;
z5 = (-1u,.7u);
z6 = (9u,.7u);
z7 = (0,-4u);
b = z5--z6;
draw b; Arrow(z6,0);
label.llft(btex $t$ etex, z6);
label.top(btex $x(t)$ etex, .5[z2,z3]);
draw b shifted z7; Arrow(z6+z7,0);

pickup pencircle scaled 1pt;
draw a;
draw a shifted z7 dashed evenly;
pickup pencircle scaled .7pt;

label.llft(btex $t$ etex, z6+z7);
label.top(btex $x_{\delta}(t)$ etex, .5[z2,z3]) shifted z7;
c = a shifted z7;
p1 = (2u,-6u)--(2u,0);
p2 = (3u,-6u)--(3u,0);
p3 = (4u,-6u)--(4u,0);
p4 = (5u,-6u)--(5u,0);
p5 = (6u,-6u)--(6u,0);
p6 = (7u,-6u)--(7u,0);

dotlabel("", c intersectionpoint p1);
dotlabel("", c intersectionpoint p2);
dotlabel("", c intersectionpoint p3);
dotlabel("", c intersectionpoint p4);
dotlabel("", c intersectionpoint p5);
dotlabel("", c intersectionpoint p6);
z8 = c intersectionpoint p1;
z9 = c intersectionpoint p2;
z10 = c intersectionpoint p3;
z11 = c intersectionpoint p4;
z12 = c intersectionpoint p5;
z13 = c intersectionpoint p6;
draw (2u,-3.3u)--z8;
draw (3u,-3.3u)--z9;
draw (4u,-3.3u)--z10;
draw (5u,-3.3u)--z11;
draw (6u,-3.3u)--z12;
draw (7u,-3.3u)--z13;
%
label.bot(btex $0$ etex, (2u,-3.3u));
label.bot(btex $T_s$ etex, (3u,-3.3u));
label.bot(btex $2T_s$ etex, (4u,-3.3u));
label.bot(btex $3T_s$ etex, (5u,-3.3u));
label.bot(btex $4T_s$ etex, (6u,-3.3u));
label.bot(btex $5T_s$ etex, (7u,-3.3u));
dotlabel.bot(btex $0$ etex, (2u,.7u));
label.top(btex $\ldots$ etex, (8u,-3u));
label.top(btex $\ldots$ etex, (1u,-3u));
endfig;



beginfig(12);  % frequency sampling
path a, b, c, p[];
z0 = (4u,.7u);
z1 = (4u,3u);
z2 = (4u,3.5u);
z3 = (6u,3.5u);
z4 = (8u,3.2u);
z5 = (-1u,.7u);
z6 = (10u,.7u);
z7 = (0,-4u);
a = (-.7u,.7u)--(0,1.6u)--(.7u,.7u);
label.bot(btex $B$ etex, (4.7u,.7u));
label.bot(btex $-B$ etex, (3.3u,.7u));
b = z5--z6;
draw b; Arrow(z6,0);
c = z0--z1;
draw c; Arrow(z1,90);
draw c shifted z7; Arrow((4u,-1u),90);
label.bot(btex $0$ etex, z0);
label.llft(btex $f$ etex, z6);
label.lrt(btex $X(f)$ etex, z1);
draw b shifted z7; Arrow(z6+z7,0);
label.llft(btex $f$ etex, z6+z7);
label.lrt(btex $x_{\delta}(f)$ etex, z1+z7);
label.bot(btex $0$ etex, (4u,-3.6u));
label.bot(btex \scriptsize $B$ etex, (4.7u,-3.1u));
label.bot(btex \scriptsize $f_s-B$ etex, (5.3u,-3.1u));
label.bot(btex \scriptsize $f_s+B$ etex, (6.7u,-3.1u));
label.bot(btex \scriptsize $-B$ etex, (3.3u,-3.1u));
label.bot(btex $-f_s$ etex, (2u,-3.6u));
label.bot(btex $-2f_s$ etex, (0,-3.6u));
label.bot(btex $f_s$ etex, (6u,-3.6u));
label.bot(btex $2f_s$ etex, (8u,-3.6u));
label.bot(btex $\ldots$ etex, (9.2u,-2.5u));
label.bot(btex $\ldots$ etex, (-1u,-2.5u));
pickup pencircle scaled 1pt;
draw a shifted (4u,0); % upper part
draw a shifted (0,-4u);
draw a shifted (4u,-4u);
draw a shifted (2u,-4u);
draw a shifted (6u,-4u);
draw a shifted (8u,-4u); % rightmost
endfig;

 
beginfig(13);  % a system
label(btex Input etex, (1.5u,0));
label(btex System etex, (4u,0));
label(btex Output etex,(6.5u,0));
draw (0,-1u)--(3u,-1u); Arrow((3u,-1u),0);
draw (5u,-1u)--(8u,-1u); Arrow((8u,-1u),0);
label(btex $x(t)$ etex,(1.6u,-1.4u));
label(btex $y(t)$ etex,(7.6u,-1.4u));
label(btex \framebox[18mm]{\bigupdownstrut$f$} etex,(4.1u,-1u));
endfig;


beginfig(14); % Parameters of a filter, Figure 1.11
z0 = (0,0);
z1 = (9u,0);
z2 = (0,6u);
z3 = (3u,3.3u);
z4 = (0,4.1u);
z5 = (0,3.3u);
z6 = (3u,0);
z7 = (3.8u,4.1u);
z8 = (6u,3.3u);
z9 = (6u,0);
z10 = (4.5u,4.1u);
z11 = (3u,3.3u);
z12 = (6u,3.3u);
z13 = (3.8u,0);
z14 = (5.2u,0);
z15 = (5.2u,4.1u);

Arrow(z1,0);
Arrow(z2,90);
label.ulft(btex $f$ etex,z1);
label.lrt(btex $|H(f)|$ etex, z2);
label.bot(btex \scriptsize Stop Band etex, (1u,0));
label.bot(btex \scriptsize \begin{tabular}{c} Transition\\ Band\end{tabular} etex, (2.4u,0));
label.bot(btex \scriptsize Passband etex, (4.5u,0));
label.bot(btex \scriptsize \begin{tabular}{c} Transition\\ Band\end{tabular} etex, (6.6u,0));
label.bot(btex \scriptsize Stop Band etex, (8.2u,0));
draw z0--z1;
draw z0--z2;
draw z3--z6 dashed evenly;
draw z4--z7 dashed evenly;
draw z5--z8 dashed evenly;
draw z14--z15 dashed evenly;
draw z13--z7 dashed evenly;
draw z8--z9 dashed evenly;
label.lft(btex $|H(f)|_{\max}$ etex,z4);
label.lft(btex $\frac{1}{\sqrt{2}}|H(f)|_{\max}$ etex,z5); 
draw (3u,2u)--(3.3u,2u);
draw (5.7u,2u)--(6u,2u);
label(btex 3\,dB bandwidth etex, (4.5u,2u));
Arrow((3.15u,2u),180);
Arrow((5.85u,2u),0);
pickup pencircle scaled 1pt;
draw (1.8u,0)..(2.3u,.8u)..z11..(3.2u,3.85u)..z10..(5.8u,3.85u)..z12..(6.7u,.8u)..(7.2u,0); 
pickup pencircle scaled .7pt;
endfig;



beginfig(15); % Trnasmit time and start of subframes, Figure 8.8
z0 = (0,0);
z1 = (0,2u);
z2 = (0,3u);
z3 = (0,4u);
z4 = (0,5u);
z5 = (2u,.5u);
z6 = (2u,5u);
z7 = (4.5u,.5u);
z8 = (4.5u,5u);
z9 = (9u,.5u);
z10 = (4.8u,1.9u);
z11 = (4.8u,2.4u);
z12 = (5.4u,2.9u);
z13 = (5.4u,3.4u);
z14 = (5.1u,3.9u);
z15 = (5.1u,4.4u);
z16 = (4.5u,4.9u);
z17 = (4.5u,5.4u);

label.rt(btex Channel 4 etex,z1);
label.rt(btex Channel 3 etex,z2);
label.rt(btex Channel 2 etex,z3);
label.rt(btex Channel 1 etex,z4);
draw z5--z6 dashed evenly;
draw z7--z8 dashed evenly;
draw z5--z9;
Arrow(z9,0);
label.bot(btex 409,807 etex, z5);
label.llft(btex Time [s] etex, z9);
pickup pencircle scaled 2pt;
draw z10--z11;
draw z12--z13;
draw z14--z15;
draw z16--z17;
pickup pencircle scaled .4pt;
label(btex 68\,ms etex, (3.25u,1u));
draw (2u,1u)--(2.7u,1u);
draw (3.8u,1u)--(4.5u,1u);
Arrow((2.2u,1u),180);
Arrow((4.3u,1u),0);
endfig;


beginfig(16); % Figure 2.2
path a, p[], q;
p1 = (0,0){up}..tension 2 and 5..(.05u,.5u)..tension 5 
      and 2..(.1u,0)..tension 2 and 5..(.15u,-.5u)..tension 5 and 2..{up}(.2u,0);
p2 = p1..(p1 shifted (.2u,0));
p0 = p2;
for i = 1 upto 7: p0:=p0..p2 shifted (i*.4u,0);
endfor
draw p0;
draw p0 shifted (3.2u,0);
draw p0 shifted (7.9u,0);

q = (0,0.5u)--(.2u,.5u)--(.2u,-.5u)--(.6u,-.5u)--(.6u,.5u)--(.8u,.5u)--
    (.8u,-.5u)--(1u,-.5u)--(1u,.5u)--(1.4u,.5u)--(1.4u,-.5u)--(1.6u,-.5u)--
(1.6u,0.5u)--(1.8u,.5u)--(1.8u,-.5u)--(2u,-.5u)--(2u,.5u)--(2.4u,.5u)--
(2.4u,-.5u)--(2.8u,-.5u)--(2.8u,.5u)--(3u,.5u)--(3u,-.5u)--(3.2u,-.5u);
draw q shifted (0,-1.5u);
draw q shifted (3.2u,-1.5u);
draw q shifted (7.9u,-1.5u);

draw (0,-2.5u)--(7.9u,-2.5u);
draw (7.9u,-3.5u)--(11.1u,-3.5u);
draw (0,-4.5u)--(11.5u,-4.5u);

pickup pencircle scaled 1pt;
draw (0,-4.5u)--(0,1u);
draw (3.2u,-4.5u)--(3.2u,1u);
draw (6.4u,-4.5u)--(6.4u,1u);
draw (7.9u,-4.5u)--(7.9u,1u);
draw (11.1u,-4.5u)--(11.1u,1u);
pickup pencircle scaled .4pt;

label(btex Carrier $f(t)$ etex,(-1.2u,0));
label(btex Code $C(t)$ etex,(-1.2u,-1.5u));
label(btex Data $D(t)$ etex,(-1.2u,-3u));

label.bot(btex $0$ etex,(0,-4.5u));
label.bot(btex $1$ etex,(3.2u,-4.5u));
label.bot(btex $2$ etex,(6.4u,-4.5u));
label.bot(btex $20$ etex,(7.9u,-4.5u));
label.bot(btex $21$ etex,(11.1u,-4.5u));
label.bot(btex Time [ms] etex,(5.8u,-5u));

path a;
a = fullcircle scaled 6mm;
fill a shifted (7.15u,-4.5u) withcolor 1white;
fill a shifted (7.15u,-2.5u) withcolor 1white;
endfig;


beginfig(17); % Figure 7.21
path a, q;
q = (0,-.5u)--(0,0.5u)--(.2u,.5u)--(.2u,-.5u)--(.6u,-.5u)--(.6u,.5u)--(.8u,.5u)--
    (.8u,-.5u)--(1u,-.5u)--(1u,.5u)--(1.4u,.5u)--(1.4u,-.5u)--(1.6u,-.5u)--
(1.6u,0.5u)--(1.8u,.5u)--(1.8u,-.5u)--(2u,-.5u)--(2u,.5u)--(2.4u,.5u)--
(2.4u,-.5u)--(2.8u,-.5u)--(2.8u,.5u)--(3u,.5u)--(3u,-.5u)--(3.2u,-.5u);
draw q shifted (0,-1.5u);
draw q shifted (4.9u,-3u); %shifted .2u additionally
draw q shifted (8.1u,-3u);
draw (0,-4.5u)--(11.5u,-4.5u); % x-axis
pickup pencircle scaled 1pt;
draw (0,-4.5u)--(0,-.5u);
draw (3.2u,-4.5u)--(3.2u,-.5u);
draw (4.7u,-4.5u)--(4.7u,-.5u);
draw (7.9u,-4.5u)--(7.9u,-.5u);
pickup pencircle scaled .4pt;
label(btex  \begin{tabular}{c} Transmitted\\ code\end{tabular} etex,(-1.2u,-1.5u));
label(btex \begin{tabular}{c} Received\\ code\end{tabular} etex,(-1.2u,-3u));
label.bot(btex 0 etex, (0,-4.5u));
label.bot(btex 1 etex, (3.2u,-4.5u));
label.bot(btex 70 etex, (4.7u,-4.5u));
label.bot(btex 71 etex, (7.9u,-4.5u));
Arrow((11.5u,-4.5u),0);
label.bot(btex Time [ms] etex,(5.8u,-5u));
label.top(btex Frame 1 etex, (1.6u,-4.5u));
label.top(btex Frame 71 etex, (6.3u,-4.5u));
label.top(btex Frame 72 etex, (9.5u,-4.5u));
path a;
a = fullcircle scaled 6mm;
fill a shifted (3.95u,-4.5u) withcolor 1white;
endfig;




beginfig(18); % Figure 7.22
path q;
q = (0,-.5u)--(0,0.5u)--(.2u,.5u)--(.2u,-.5u)--(.6u,-.5u)--(.6u,.5u)--(.8u,.5u)--
    (.8u,-.5u)--(1u,-.5u)--(1u,.5u)--(1.4u,.5u)--(1.4u,-.5u)--(1.6u,-.5u)--
(1.6u,0.5u)--(1.8u,.5u)--(1.8u,-.5u)--(2u,-.5u)--(2u,.5u)--(2.4u,.5u)--
(2.4u,-.5u)--(2.8u,-.5u)--(2.8u,.5u)--(3u,.5u)--(3u,-.5u)--(3.2u,-.5u);
draw q shifted (9.075u,-3u);
draw (0,-4.5u)--(11.5u,-4.5u); % x-axis
draw (0,-4.5u)--(0,-4.3u);
draw (1.5u,-4.5u)--(1.5u,-4.3u); % tick at 100
draw (3u,-4.5u)--(3u,-4.3u); 
draw (4.5u,-4.5u)--(4.5u,-4.3u); 
draw (6u,-4.5u)--(6u,-4.3u); 
draw (7.5u,-4.5u)--(7.5u,-4.3u); 
draw (9u,-4.5u)--(9u,-4.3u); 
draw (10.5u,-4.5u)--(10.5u,-4.3u);
pickup pencircle scaled 1pt;
draw (9.075u,-4.5u)--(9.075u,-2u);
pickup pencircle scaled .4pt;
label(btex \begin{tabular}{c} Received\\ code\end{tabular} etex,(-1.2u,-3u));
label.bot(btex 0 etex, (0,-4.5u));
label.bot(btex 100 etex, (1.5u,-4.5u));
label.bot(btex 200 etex, (3u,-4.5u));
label.bot(btex 300 etex, (4.5u,-4.5u));
label.bot(btex 400 etex, (6u,-4.5u));
label.bot(btex 500 etex, (7.5u,-4.5u));
label.bot(btex 600 etex, (9u,-4.5u));
label.bot(btex 700 etex, (10.5u,-4.5u));
label.top(btex 605 etex, (9.075u,-2u));
Arrow((11.5u,-4.5u),0);
label.bot(btex Time [samples] etex,(5.8u,-5u));
label.top(btex Frame 71 etex, (6.3u,-4.5u));
endfig;



beginfig(19); % Figure B.7
z0 = (0,0);
z1 = (2.5u,0);
z2 = (5u,0);
z3 = (7.5u,0);
z4 = (10u,0);
z5 = (11.5u,0);
z6 = (2.5u,.3u);
z7 = (5u,.3u);
z8 = (7.5u,.3u);
z9 = (10u,.3u);
z10 = (7.5u,2.5u);
z11 = (7.5u,1.7u);
draw z1--z5;
draw z1--z6;
draw z2--z7;
draw z3--z8;
draw z4--z9;
draw z10--z11;
draw (13.3u,0)--(14u,0);
draw (2.5u,1.7u)--(2.5u,2.8u)--(7.5u,2.8u);
draw (5u,1.7u)--(5u,5.3u)--(8.5u,5.3u);
draw z11--(7.5u,3.4u)--(8.5u,3.4u);
draw (10u,1.7u)--(10u,2.2u)--(7.5u,2.2u);
draw (2.5u,2.8u)--(2.5u,3.5u)--(5u,3.5u);
draw (8u,7u)--(14u,7u);


draw (11.5u,3.45u)--(14u,3.45u); % double line pilot
draw (11.5u,3.41u)--(14u,3.41u);
draw (11.5u,5.45u)--(14u,5.45u); % double line data
draw (11.5u,5.41u)--(14u,5.41u);
draw (4.5u,7u)--(6.1u,7u); % west of Carrier NCO
draw (4.5u,6.96u)--(6.1u,6.96u);
draw (4.5u,7u)--(4.5u,5.6u); % north of IF
draw (4.54u,7u)--(4.54u,5.6u);
draw (6.5u,5.6u)--(6.5u,3.7u); % south of I,Q
draw (6.54u,5.6u)--(6.54u,3.7u);
draw (6.5u,3.7u)--(8.5u,3.7u);
draw (6.5u,3.74u)--(8.5u,3.74u);

draw (2.5u,5.6u)--(4.5u,5.6u); % IF line
draw (4.5u,5.62u)--(8.5u,5.62u);
draw (4.5u,5.58u)--(8.5u,5.58u);

label.urt(btex IF etex, (2.5u,5.6u));
Arrow((8.3u,5.6u),0); % IF arrow
Arrow((4.2u,5.6u),0); % IF arrow
Arrow((8.1u,7u),180);
Arrow((2.5u,.15u),90);
Arrow((5u,.15u),90);
Arrow((7.5u,.15u),90);
Arrow((10u,.15u),90);
Arrow((13.5u,0),180);
Arrow((13.8u,3.43u),0); % double pilot
Arrow((13.8u,5.43u),0); % double data
Arrow((4.7u,3.5u),0);
Arrow((5u,3.2u),90);
Arrow((7.2u,2.8u),0);
Arrow((7.5u,2.5u),90);
Arrow((7.8u,2.2u),180);
Arrow((8.3u,3.4u),0);
Arrow((8.3u,5.3u),0);
Arrow((4.52u,5.95u),-90);
Arrow ((8.3u,3.72u),0);

path a;
a = fullcircle scaled 3mm;
fill a shifted (7.5u,2.2u) withcolor 1white;
fill a shifted (7.5u,2.8u) withcolor 1white;
fill a shifted (5u,3.5u) withcolor 1white;
fill a shifted (4.5u,5.6u) withcolor 1white;

label(btex $\bigotimes$ etex, (7.5u,2.2u));
label(btex $\bigotimes$ etex, (7.5u,2.8u));
label(btex $\bigotimes$ etex, (5u,3.5u));
label(btex $\bigotimes$ etex, (4.5u,5.6u));
label.top(btex $(I,Q)$ etex, (6.5u,5.4u));

label(btex \framebox[18mm]{\bigupdownstrut\begin{tabular}{c} BOC\\ generator\end{tabular}} etex,(2.5u,1u));
label(btex \framebox[18mm]{\bigupdownstrut\begin{tabular}{c} PRN\\ generator 1\end{tabular}} etex,(5u,1u));
label(btex \framebox[18mm]{\bigupdownstrut\begin{tabular}{c} PRN\\ generator 2\end{tabular}} etex,(7.5u,1u));
label(btex \framebox[18mm]{\bigupdownstrut\begin{tabular}{c} Secondary\\code\end{tabular}} etex,(10u,1u));
label(btex \framebox[18mm]{\bigupdownstrut\begin{tabular}{c} Code\\ NCO\end{tabular}} etex,(12.4u,0));
label(btex \framebox[30mm]{\bigupdownstrut\begin{tabular}{c} E, P, L correlator\\ pilot\end{tabular}} etex,(10u,3.5u));
label(btex \framebox[30mm]{\bigupdownstrut\begin{tabular}{c} E, P, L correlator\\ data\end{tabular}} etex,(10u,5.5u));
label(btex \framebox[18mm]{\bigupdownstrut\begin{tabular}{c} Carrier\\ NCO\end{tabular}} etex,(7u,7u));
label(btex \framebox[18mm]{\Bigupdownstrut\begin{tabular}{c}
       Loop\\discrimin-\\ators/ \\ filters\end{tabular}} etex,(14.9u,3.5u));
endfig;


beginfig(20); % Fig 1.10 Simple linear system
z0 = (0,0);
z1 = (8u,1.5u);
z2 = (4u,0);
z3 = (8u,0);
z4 = (10u,0);
z5 = (8u,3u);
z6 = (4u,3u);
z7 = (0,3u);
z8 = (-1u,3u);
z9 = (0,1.5u);
z10 = (4u,1.5u);
draw z7--z0--z4;
draw z5--z8;
draw z2--z6;
draw z3--z5;
pickup pencircle scaled 1pt;
draw (1.5u,3u)--(2.5u,3u) withcolor 1white;
draw (5.5u,3u)--(6.5u,3u) withcolor 1white;
pickup pencircle scaled .4pt;
label(btex $\framebox{Delay}$ etex, .5[z6,z7]);
label(btex $\framebox{Delay}$ etex, .5[z5,z6]);

path a;
a = fullcircle scaled 7mm;
fill a shifted z9 withcolor 1white;
fill a shifted z2 withcolor 1white;
fill a shifted z3 withcolor 1white;
fill a shifted z1 withcolor 1white;
fill a shifted z10 withcolor 1white;
label(btex $1$ etex, z9);
label(btex $a_1$ etex, z10);
label(btex $a_2$ etex, z1);
label(btex $\Sigma$ etex, z2);
label(btex $\Sigma$ etex, z3);
draw a shifted z10;
draw a shifted z9;
draw a shifted z1;
draw a shifted z2;
draw a shifted z3;
label.top(btex $x(n)$ etex, z7);
label.top(btex $x(n-1)$ etex, z6);
label.top(btex $x(n-2)$ etex, (7.4u,3u)); %%%
label.ulft(btex $y(n)$ etex, z4);
Arrow(z4,0);
Arrow((1.3u,3u),0);
Arrow((3.5u,0),0);
Arrow((7.5u,0),0);
Arrow((4u,.5u),-90);
Arrow((8u,.5u),-90);
endfig;



beginfig(21);  % Figure 1.12 Magnitude spectrum of bandpass ...
path a, b, c, d;
z0 = (4u,-3.3u);
z1 = (4u,-1u);
z2 = (4u,3.5u);
z3 = (6u,3.5u);
z4 = (8u,3.2u);
z5 = (-1u,-3.3u);
z6 = (8u,-3.3u);
z7 = (0,4u);
a = (-.7u,-3.3u)--(-.7u,-2.4u)--(0,-2.4u)--(.7u,-3.3u);
d = (-.7u,-3.3u)--(0,-2.4u)--(.7u,-2.4u)--(.7u,-3.3u);
%lower part
label.bot(btex $W$ etex, (4.7u,-3.3u));
label.bot(btex $-W$ etex, (3.3u,-3.3u));
b = z5--z6;
draw b; Arrow(z6,0);
label.llft(btex $f$ etex, z6);
c = z0--z1;
draw c; Arrow(z1,90);
label.bot(btex $0$ etex, z0);
label.lrt(btex $|\widetilde{S}(f)|$ etex, z1);
label.rt(btex $2|S(f_c)|$ etex, (4u,-2.5u));
pickup pencircle scaled 1pt;
draw a shifted (4u,0);
pickup pencircle scaled 0.4pt;
draw c shifted z7; Arrow((4u,-1u),90);

%upper part
draw b shifted z7; Arrow(z6+z7,0);
label.llft(btex $f$ etex, z6+z7);
label.lrt(btex $|S(f)|$ etex, z1+z7);
label.bot(btex $f_c$ etex, (6u,0.7u));
label.bot(btex $-f_c$ etex, (2u,0.7u));
Arrow((4u,2.8u),90);
label.rt(btex $|S(f_c)|$ etex,(3.8u,1.9u));
pickup pencircle scaled 1pt;
draw (2.7u,1.6u)--(5.3u,1.6u) dashed evenly;
draw d shifted (2u,4u);
draw a shifted (6u,4u);
pickup pencircle scaled 0.4pt;
draw (2u,0.6u)--(2u,0.8u);
draw (6u,0.6u)--(6u,0.8u);
draw (1.3u,-.2u)--(2.7u,-.2u);
Arrow((1.5u,-.2u),180);
Arrow((2.5u,-.2u),0);
label(btex $2W$ etex,(2.05u,-.5u)); 
draw (5.3u,-.2u)--(6.7u,-.2u);
Arrow((5.5u,-.2u),180);
Arrow((6.5u,-.2u),0);
label(btex $2W$ etex,(6.05u,-.5u)); 
endfig;

beginfig(22);
path a;
z0 = (-2.5u,0);
z1 = (3u,0);
z2 = (0,-2.5u);
z3 = (0,3u);
draw z0--z1;
draw z2--z3;
Arrow(z1,0);
Arrow(z3,90);
a = fullcircle scaled 40mm;
draw a;
label.llft(btex $I$ etex,z1);
label.llft(btex $Q$ etex,z3);
label(btex $\bullet$ etex, (1.8856u,.666u));
label(btex $\bullet$ etex, (1.8856u,-.666u));
label(btex $\bullet$ etex, (-1.8856u,-.666u));
label(btex $\bullet$ etex, (-1.8856u,.666u));
label(btex $\bullet$ etex, (0,2u));
label(btex $\bullet$ etex, (0,-2u));
label.urt(btex $(0,i)$ etex, (0,2u));
label.lrt(btex $(0,-i)$ etex, (0,-2u));
endfig;

beginfig(23);
v = 0.2875cm;
z0 = (0,0);
z1 = (-4.5u,0);
z2 = (5u,0);
z3 = (0,-1.5u);
z4 = (0,2u);
z5 = (-3v,1u);
z6 = (-2v,0);
z7 = (-2v,1u);
z8 = (-1v,0);
z9 = (-1v,1u);
z10 = (1v,-1u);
z11 = (1v,0);
z12 = (2v,-1u);
z13 = (2v,0);
z14 = (3v,-1u);
z15 = (3v,0);
z16 = (4v,-1u);
draw z1--z2; Arrow(z2,0);
draw z3--z4; Arrow(z4,90);
dotlabel.rt(btex $(0,\pi)$ etex, (0,1u));
dotlabel.lft(btex $(0,-\pi)$ etex, (0,-1u));
label.llft(btex $\omega$ etex, z2);
label.lrt(btex $\arg\bigl(F(\omega)\bigr)$ etex, z4);
draw z5--z6--z7--z8--z9--z10--z11--z12--z13--z14--z15--z16;
label.llft(btex $\ldots$ etex, z5);
label.urt(btex $\ldots$ etex, z16);
endfig;

end
