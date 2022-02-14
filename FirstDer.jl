# code to calculate the first derivative of a function using finite differences
# function to be evaluated is a sin function 
#Initial Parameters
using Statistics
xmax=10.0
nx=200
dx=xmax/(nx-1)
x=LinRange(0,xmax,nx)
#Initialization of the sin function
l=20*dx #wavelength
k=2*pi/l
f=sin.(k.*x)
using PyPlot
figure(1)
plot(x,f)
xlabel("X")
ylabel("Amplitude")
title("Sin function")
#Initialize the analytical and numerical derivatives
ader=zeros(nx)
nder=zeros(nx)
#Numerical derivative
for i in 2:nx-1
    nder[i]=(f[i+1]-f[i-1])/(2*dx)
end
#Analytical derivative
ader=k*cos.(k.*x)
ader[1]=0
ader[nx]=0
#Calculate RMS error
t1=(ader.-nder)
t2=t1.^2
t3=mean(t2)
rms=sqrt.(t3)
difference=ader-nder
figure(2)
plot(x,ader)
plot(x,nder)
plot(x,difference)
xlabel("X")
ylabel("Amplitude")
title("Derivatives rms error: $rms")
gcf()