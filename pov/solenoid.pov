//******************************************************************************************
//* Magnetic Field of a Solenoid, copyright by Paul Nylander, bugman123.com, 5/17/06
//* runtime: 1 minute
//******************************************************************************************

#declare mu0=1.25663706144e-6; #declare n=6; #declare R=0.01; #declare dL=(4/3)*R; #declare r=R/4;
camera{location <13.65,0,16.25>*R look_at 0.4*R*x up -y right x*image_width/image_height sky -y angle 25}
light_source{<0,0,8*R>,1}

//Solenoid
#include "golds.inc"
#declare begin=1; #declare x1=(0.25-n/2)*dL;
#while(x1<=(n/2-0.25)*dL)
 #declare theta=2*pi*(x1/dL+n/2); #declare p2=<x1,R*sin(theta),-R*cos(theta)>;
 sphere{p2,r texture{T_Gold_5A}} #if(!begin) cylinder{p1,p2,r texture{T_Gold_1A}} #end
 #declare begin=0; #declare p1=p2; #declare x1=x1+0.005*dL;
#end

//Electromagnetic Field
#declare Sqr=function(X) {X*X};
#declare sign=function(i1) {1-2*floor(2*mod((i1-1)/2,n)/n)}; // i1<n1?1:-1
#declare I=function(i1) {sign(i1)}; // current
#declare xcoil=function(i1) {(4/3)*R*(mod(i1-1,n)+0.5*floor(2*mod((i1-1)/2,n)/n)-0.5*(n-0.5))};
#declare B=function{(mu0/(2*pi))*sqrt( // magnetic field magnitude
 Sqr(sum(i1,1,2*n,I(i1)*(y-sign(i1)*R)/(Sqr(x-xcoil(i1))+Sqr(y-sign(i1)*R))))+
 Sqr(sum(i1,1,2*n,I(i1)*(x-xcoil(i1))/(Sqr(x-xcoil(i1))+Sqr(y-sign(i1)*R))))
)}
#declare contours=function{(2+cos(0.06*pi*(sum(i1,1,2*n,I(i1)/sqrt(Sqr(x-xcoil(i1))+Sqr(y-sign(i1)*R))))))/3} // magnetic field line contours
plane{<0,0,1>,0
 pigment{function{min(1,max(0,12000*B(x,y,0)*contours(x,y,0)))} color_map{
  [0 rgbt <0,0,1,1>] [0.25 rgbt <0,0,1,0.75>] [0.5 rgbt <1/3,0,1,0.5>] [0.75 rgbt <2/3,0.5,1,0.25>] [1 rgbt <1,1,1,0>]
 }}
 finish{ambient 2.25 reflection 0 diffuse 0 specular 0}
}
