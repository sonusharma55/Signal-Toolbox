exec ../FOSSEE_Scilab_Octave_Interface_Toolbox/loader.sce

exec loader.sce
exec builder.sce
exec unloader.sce
exec loader.sce
//cd macros
//getd .

test_pass=[]
res=[]


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
//
//
///////////////////////////////////////////////
//
//
///////////Test case for       9) Istrellis                  //////////
//
//trellis.numInputSymbols = 2;
//trellis.numOutputSymbols = 2;
//trellis.numStates = 2;
//trellis.nextStates = [0 1;0 1];
//trellis.outputs = [0 0;1 1];
//
//[isok,status] = istrellis(trellis)
//
//if(isempty(status) & isok)
//           test_pass=[test_pass,1]
//    else
//	test_pass=[test_pass,0]
//	disp("istrellis Test failed")
//end
//
///////////////////////////////////////////////
//
//
///////////Test case for       10)iscatastrophic                  //////////
//
//   eg_1.numInputSymbols = 4;
//   eg_1.numOutputSymbols = 4;
//   eg_1.numStates = 3;
//   eg_1.nextStates = [0 1 2 1;0 1 2 1; 0 1 2 1];
//   eg_1.outputs = [0 0 1 1;1 1 2 1; 1 0 1 1];
//
//  res_c_eg_1=iscatastrophic(eg_1)
//
//
//if(res_c_eg_1==0)
//           test_pass=[test_pass,1]
//else
//	test_pass=[test_pass,0]
//	disp("iscatastrophic Test failed")
//end
//
///////////////////////////////////////////////
//
//
//
///////////Test case for       11)iqimbal2coef                  //////////
//
//
//ampImb = 2;      // dB
//phImb = 15;      // degrees
//
//compcoef = iqimbal2coef(ampImb,phImb)
//compcoef=roundn(compcoef,4)
//
//if(compcoef==[-0.1126+0.1334*%i 0])
//           test_pass=[test_pass,1]
//else
//	test_pass=[test_pass,0]
//	disp("Iqimbal2coef Test failed")
//end
//
///////////////////////////////////////////////
//
//
//
///////////Test case for       12)iqcoef2imbal                 //////////
//
//x=[4 2 complex(-0.1145,0.1297) complex(-0.0013,0.0029)];
//
//[a_imb_db,ph_imb_deq] = iqcoef2imbal(x);
//a_imb_db=roundn(a_imb_db,4);
//ph_imb_deq=roundn(ph_imb_deq,4)
//
//if(a_imb_db==[4.437 9.5424 2.0319 0.0226] &ph_imb_deq==[180 180 14.5877 0.3323])
//           test_pass=[test_pass,1]
//else
//	test_pass=[test_pass,0]
//	disp("Iqcoef2imbal Test failed")
//end
//
///////////////////////////////////////////////
//
//
///////////Test case for       13)lteZadoffChuSeq                 //////////
//
//a=25;
//b=139;
//
//seq = lteZadoffChuSeq(a,b);
//seq=roundn(seq,3);
//
//M1=fscanfMat("txt1_ltezadoffchuseq");
//M2=fscanfMat("txt2_ltezadoffchuseq");
//
//if(real(seq)==M1 & imag(seq)==M2) 
//           test_pass=[test_pass,1]
//else
//	test_pass=[test_pass,0]
//	disp("iteZadoffChuSeq Test failed")
//end
//
///////////////////////////////////////////////
//
//
///////////Test case for       14)ssbmod                 //////////
//
//Fs =50;
//t = [0:2*Fs+1]'/Fs;
//ini_phase = 5;
//Fc = 20;
//fm1= 2;
//fm2= 3;
//x =sin(2*fm1*%pi*t)+cos(2*fm2*%pi*t);    //message signal
//
//y = ssbmod(x,Fc,Fs,ini_phase);
//y=roundn(y,4);
//
//M=fscanfMat("txt3_ssbmod");
//
//if(y==M) 
//           test_pass=[test_pass,1]
//else
//	test_pass=[test_pass,0]
//	disp("ssbmod Test failed")
//end
//
///////////////////////////////////////////////
//
//
//
///////////Test case for       14)ssbdemod                 //////////
//
//Fs =50;
//t = [0:2*Fs+1]'/Fs;
//ini_phase = 5;
//Fc = 20;
//fm1= 2;
//fm2= 3;
//x =sin(2*fm1*%pi*t)+cos(2*fm2*%pi*t);    //message signal
//y = ssbmod(x,Fc,Fs,ini_phase);  //modulated signal
//
//o = ssbdemod(y,Fc,Fs,ini_phase); 
//o = roundn(o,4);
//
//M=fscanfMat("txt4_ssbdemod");
//
//if(o==M) 
//           test_pass=[test_pass,1]
//else
//	test_pass=[test_pass,0]
//	disp("ssbdemod Test failed")
//end

/////////////////////////////////////////////


res=find(test_pass==0)

if(res~=[])
    disp("One or more tests failed")
    exit(1)
else
    disp("All test cases passed")
    exit
end
