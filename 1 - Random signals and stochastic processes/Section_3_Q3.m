clear all
close all

a = ones(1,1000);

a(1:500) = rand(500,1)-0.5;
a(501:1000) = rand(500,1)+0.5;

b = a(1:500);
c = a(501:1000);



figure 
histogram(a,20,Normalization="pdf")

figure 
histogram(b,20,Normalization="pdf")

figure 
histogram(c,20,Normalization="pdf")

