exec builder.sce
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


///////////////////////////////////////////////
//
//
///////////Test case for       3) arithdeco                  //////////
//
//seq=[1 3 2 1]
//counts=[5 2 1]
//len=4
//code = arithenco(seq,counts)
//
//dseq = arithdeco(code,counts,length(seq));
//
//if(dseq==[1 3 2 1])
//           test_pass=[test_pass,1]
//    else
//	test_pass=[test_pass,0]
//	disp("Arithdeco Test failed")
//end
//
//
//
///////////////////////////////////////////////
//
//
///////////Test case for       4) FInddelay                  //////////
//
//x=[1 2 3 4 5 6]
//y=[5 6]
//
//D1 = finddelay(x,y,5)
//D2 = finddelay(x,y,3)
//
//
//if(D1==-4 & D2==-3)
//           test_pass=[test_pass,1]
//    else
//	test_pass=[test_pass,0]
//	disp("Finddelay Test failed")
//end
//
///////////////////////////////////////////////
//
//
///////////Test case for       5) Gfcosets                  //////////
//
//a=2;
//b=3;
//
//c = gfcosets(a,b)
//
//if(c(:,1)==[0;1;2;4;5] & c(2,2)==3 & c(3,2)==6 & c(5,2)==7 & isnan(c(1,2)) & isnan(c(4,2)))
//           test_pass=[test_pass,1]
//    else
//	test_pass=[test_pass,0]
//	disp("gfcosets Test failed")
//end
//
///////////////////////////////////////////////
//
//
///////////Test case for       6) Gflineq                  //////////
//
//A = [2 0 1;1 1 0;1 1 2]
//b=[1;0;0]
//p=3
//
//[x,vld] = gflineq(A,b,p)
//
//
//if(vld==1 & x==[2;1;0])
//           test_pass=[test_pass,1]
//    else
//	test_pass=[test_pass,0]
//	disp("Gflineq Test failed")
//end
//
///////////////////////////////////////////////
//
//
///////////Test case for       7) Gfrepcov                  //////////
//
//x=[1 2 4 6];
//
//polystandard = gfrepcov(x)
//
//if(polystandard==[0 1 1 0 1 0 1])
//           test_pass=[test_pass,1]
//    else
//	test_pass=[test_pass,0]
//	disp("Gfrepcov Test failed")
//end
//
///////////////////////////////////////////////
//
//
///////////Test case for       8) Gftrunc                  //////////
//
//a=[0 0 1 2 3 0 0 4 5 0 0];
//
//c = gftrunc(a)
//
//if(c==[0 0 1 2 3 0 0 4 5])
//           test_pass=[test_pass,1]
//    else
//	test_pass=[test_pass,0]
//	disp("Gftrunc Test failed")
//end
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
    disp("pass")
	exit
end
