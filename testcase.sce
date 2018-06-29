//exec FOSSEE_Scilab_Octave_Interface_Toolbox/loader.sce

exec loader.sce
exec builder.sce
exec unloader.sce
exec loader.sce
//cd macros
//getd .

test_pass=[]
res=[]


/////////Test case for       2) arburg                  //////////

a = arburg([1,2,3,4,5],2);
a = round(a*10000)/10000;

if(a == [1.  -1.8639    0.9571])
    test_pass=[test_pass,1]
else
    test_pass=[test_pass,0]
    disp("arburg test failed")
end

/////////Test case for       4) aryule                  //////////

a = aryule([1,2,3,4,5],2);
a = round(a*10000)/10000;

if(a == [1.  -0.814    0.1193])
    test_pass=[test_pass,1]
else
    test_pass=[test_pass,0]
    disp("aryule test failed")
end

/////////Test case for       5) bitrevorder                  //////////

x = [%i,1,3,6*%i] ;
[y i]=bitrevorder(x);

if(y == [%i   3   1   6*%i] & i == [1 3 2 4])
    test_pass=[test_pass,1]
else
    test_pass=[test_pass,0]
    disp("bitrevorder test failed")
end

/////////Test case for       **) digitrevorder                  //////////

x = [%i,1,3,6*%i] ;
b = 2;
[y i]=digitrevorder(x,b);

if(y == [%i   3   1   6*%i] & i == [1 3 2 4])
    test_pass=[test_pass,1]
else
    test_pass=[test_pass,0]
    disp("digitrevorder test failed")
end

/////////Test case for       28) isfir                  //////////

fir = isfir([1 -1 1], 1)

if(fir == 1)
    test_pass=[test_pass,1]
else
    test_pass=[test_pass,0]
    disp("isfir test failed")
end

/////////////////////////////////////////////


/////////Test case for       29) islinearphase                  //////////

flag = islinphase([0 1 2 2 1 0],1)

if(flag == 1)
    test_pass=[test_pass,1]
else
    test_pass=[test_pass,0]
    disp("islinearphase Test failed")
end


/////////////////////////////////////////////


/////////Test case for       30) ismaxphase                  //////////

flag = ismaxphase([1 -5 6],1)

if(flag == 1)
    test_pass=[test_pass,1]
else
    test_pass=[test_pass,0]
    disp("ismaxphase Test failed")
end



/////////////////////////////////////////////


/////////Test case for       31) isminphase                  //////////
flag = isminphase([1 -0.3 0.02],1)

if(flag == 1)
    test_pass=[test_pass,1]
else
    test_pass=[test_pass,0]
    disp("isminphase Test failed")
end

/////////////////////////////////////////////


/////////Test case for       32) isstable                  //////////

flag = isstable([1 2],[1 -0.7 0.1])

if(flag == 1)
    test_pass=[test_pass,1]
else
    test_pass=[test_pass,0]
    disp("isstable Test failed")
end

/////////////////////////////////////////////


/////////Test case for       33)lar2rc                  //////////

g = [0.6389 4.5989 0.0063 0.0163 -0.0163];
k = lar2rc(g)

k=round(k*10000)/10000

if(k == [0.3090    0.9801    0.0031    0.0081  -0.0081])
    test_pass=[test_pass,1]
else
    test_pass=[test_pass,0]
    disp("lar2rc Test failed")
end



/////////////////////////////////////////////


/////////Test case for       38)levinson                  //////////

a = [1 0.1 -0.8];
v = 0.4;
w = sqrt(v)*rand(15000,1,"normal");
x = filter(1,a,w);

[r,lg] = xcorr(x,'biased');
r(lg<0) = [];

ar = levinson(r,length(a)-1)

ar = round(ar*10000)/10000

if(ar == [1 0.1043 -0.8010])
           test_pass=[test_pass,1]
    else
	test_pass=[test_pass,0]
	disp("levinson Test failed")
end

/////////////////////////////////////////////


/////////Test case for       39) lpc                  //////////

noise = rand(50000,1,"normal");
x = filter(1,[1 1/2 1/3 1/4],noise);
x = x(45904:50000);
[a,g]= lpc(x,3)
a = round(a*10000)/10000

if(a == [1 0.5177 0.3310 0.2572])
        test_pass=[test_pass,1]
else
    test_pass=[test_pass,0]
    disp("lpc Test failed")
end

/////////////////////////////////////////////


/////////Test case for       40) medfilt1                  //////////


fs = 100;
t = 0:1/fs:1;
x = sin(2*%pi*t*3)+0.25*sin(2*%pi*t*40);

y = medfilt1(x,10);
y = round(y*10000)/10000 ;
y = y'

if(y == fscanfMat("macros/medfilt1op.txt"))
           test_pass=[test_pass,1]
    else
	test_pass=[test_pass,0]
	disp("medfilt1 Test failed")
end

/////////////////////////////////////////////


/////////Test case for       41) movingrms                  //////////


[a,b]=movingrms ([4.4 94 1;-2 5*%i 5],1,-2)

b = round(b*10000)/10000

if(b == [0.1888 ; 0.1888])
           test_pass=[test_pass,1]
    else
	test_pass=[test_pass,0]
	disp("movingrms Test failed")
end



/////////////////////////////////////////////


/////////Test case for       58) pulseperiod                  //////////

x = fscanfMat("macros/pulsedata_x.txt");
t = fscanfMat("macros/pulsedata_t.txt");
p = pulseperiod(x,t);
p = round(p*10000)/10000

if(p == 0.5003)
           test_pass=[test_pass,1]
    else
	test_pass=[test_pass,0]
	disp("pulseperiod Test failed")
end

///////////////////////////////////////

/////////Test case for       59) pulsesep                  //////////

x = fscanfMat("macros/pulsedata_x.txt");
t = fscanfMat("macros/pulsedata_t.txt");
p = pulsesep(x,t);
p = round(p*10000)/10000

if(p == 0.3501)
           test_pass=[test_pass,1]
    else
	test_pass=[test_pass,0]
	disp("pulsesep Test failed")
end

///////////////////////////////////////

/////////Test case for       60) pulsewidth                  //////////

x = fscanfMat("macros/pulsedata_x.txt");
t = fscanfMat("macros/pulsedata_t.txt");
p = pulsewidth(x,t);
p = round(p*10000)/10000

if(p == 0.1502)
           test_pass=[test_pass,1]
    else
	test_pass=[test_pass,0]
	disp("pulsewidth Test failed")
end



/////////////////////////////////////////////


/////////Test case for       **)sigmoid_train                  //////////

s = sigmoid_train(0.1,[1:3],4)
s = round(s*10000)/10000

if(s == 0.2737)
           test_pass=[test_pass,1]
else
	test_pass=[test_pass,0]
	disp("sigmoid_train Test failed")
end

/////////////////////////////////////////////



/////////Test case for       **)circshift                  /////////

 M = [1 2 3 4];
 R = circshift(M, [0 1])

if(R == [4 1 2 3])
           test_pass=[test_pass,1]
else
	test_pass=[test_pass,0]
	disp("circshift failed")
end

/////////////////////////////////////////////



/////////Test case for       **)kaiser                 //////////

win = kaiser(6, 0.2) ;
win = round(win*10000)/10000;

if(win == [ 0.9901; 0.9964; 0.9996; 0.9996; 0.9964; 0.9901 ])
           test_pass=[test_pass,1]
else
	test_pass=[test_pass,0]
	disp("kaiser Test failed")
end

/////////////////////////////////////////////


/////////Test case for       78)stmcb                 //////////

 
h = fscanfMat("macros/stmcb_h_data.txt");
H = stmcb(h,4,4);
H = round(H*10000)/10000;

if(H == [0.0003    0.001    0.0147  -0.0078    0.0317]) 
           test_pass=[test_pass,1]
else
	test_pass=[test_pass,0]
	disp("stmcb Test failed")
end

/////////////////////////////////////////////


/////////Test case for       autoreg_matrix                 //////////
m = autoreg_matrix([1,2,3],2);

if(m == [1 0 0; 1 1 0; 1 2 1]) 
           test_pass=[test_pass,1]
else
	test_pass=[test_pass,0]
	disp("autoreg_matrix test failed")
end

/////////////////////////////////////////////



/////////Test case for       arch_rnd                 //////////

a = [1 2 3 4 5];
b = [7 8 9 10];
t = 5 ;
m = arch_rnd (a, b, t);
m = round(m*1000)/1000

if(m == [    7.476      
    67.124     
    671.105    
    7382.441   
    80409.121  ]) 
           test_pass=[test_pass,1]
else
	test_pass=[test_pass,0]
	disp("arch_rnd Test failed")
end

/////////////////////////////////////////////



/////////Test case for       arma_rnd                 //////////

a = [1 2 3 4 5];
b = [7; 8; 9; 10; 11];
t = 5 ;
v = 10 ;
n = 100 ;
m = arma_rnd (a, b, v, t, n);
m = round(m) ;

if(m == [    60562.    
    156019.   
    401911.   
    1035344.  
    2667081. ]) 
           test_pass=[test_pass,1]
else
	test_pass=[test_pass,0]
	disp("arma_rnd Test failed")
end

/////////////////////////////////////////////

/////////////////////////////////////////////


res=find(test_pass==0)

if(res~=[])
    disp("One or more tests failed")
    exit(1)
else
    disp("All test cases passed")
    exit
end
