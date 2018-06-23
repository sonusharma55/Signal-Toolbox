//if (k == 1) then
//    disp('2');
//elseif (k == 2)
//    disp('3')
//else
//    disp('4')
//end
//
//
//
//a = [1 0.1 -0.8];       //Estimate the coefficients of an autoregressive process given by    x(n) = 0.1x(n-1) - 0.8x(n-2) + w(n)
//
//v = 0.4;
//w = sqrt(v)*rand(15000,1,"normal");
//x = filter(1,a,w);
//
//[r,lg] = xcorr(x,'biased');
//r(lg<0) = [];
//
//ar = levinson1(r,length(a)-1)
////
//cd ../../FOSSEE-Signal-Processing-Toolbox-master/
