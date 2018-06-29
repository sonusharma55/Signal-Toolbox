//Analog prototype for Cauer filter.

//Calling Sequence
//[Zz, Zp, Zg] = ncauer(Rp, Rs, n)
//[Zz, Zp] = ncauer(Rp, Rs, n)
//Zz = ncauer(Rp, Rs, n)

//Parameters 
//n: Filter Order
//Rp: Peak-to-peak passband ripple
//Rs: Stopband attenuation

//Description
//This is an Octave function.
//It designs an analog prototype for Cauer filter of nth order, with a Peak-to-peak passband ripple of Rp and a stopband attenuation of Rs.


//Examples
//n = 5;
//Rp = 5;
//Rs = 5;
//[Zz, Zp, Zg] = ncauer(Rp, Rs, n)

//Zz =
//
//   0.0000 + 2.5546i   0.0000 + 1.6835i  -0.0000 - 2.5546i  -0.0000 - 1.6835i
//
//Zp =
//
//  -0.10199 + 0.64039i  -0.03168 + 0.96777i  -0.10199 - 0.64039i  -0.03168 - 0.96777i  -0.14368 + 0.00000i
//
//Zg =  0.0030628

//function [Zz, Zp, Zg] = ncauer(Rp, Rs, n)
//funcprot(0);
//lhs = argn(1)
//rhs = argn(2)
//if (rhs < 3 | rhs > 3)
//error("Wrong number of input arguments.")
//end
//
//select(rhs)
//	
//	case 3 then
//		if(lhs==1)
//		Zz = callOctave("ncauer", Rp, Rs, n)
//		elseif(lhs==2)
//		[Zz, Zp] = callOctave("ncauer", Rp, Rs, n)
//		elseif(lhs==3)
//		[Zz, Zp, Zg] = callOctave("ncauer", Rp, Rs, n)
//		else
//		error("Wrong number of output argments.")
//		end
//	end
//endfunction


function [zer, pol, T0]=ncauer(Rp, Rs, n)

  // Cutoff frequency = 1:
  wp=1;

  // Stop band edge ws:
  ws=__ellip_ws(n, Rp, Rs);

  k=wp/ws;
  k1=sqrt(1-k^2);
  q0=(1/2)*((1-sqrt(k1))/(1+sqrt(k1)));
  q= q0 + 2*q0^5 + 15*q0^9 + 150*q0^13; //(....)
  D=(10^(0.1*Rs)-1)/(10^(0.1*Rp)-1);

  // Filter order maybe this, but not used now:
  // n=ceil(log10(16*D)/log10(1/q))

  l=(1/(2*n))*log((10^(0.05*Rp)+1)/(10^(0.05*Rp)-1));
  sig01=0; sig02=0;
  for m=0 : 30
    sig01=sig01+(-1)^m * q^(m*(m+1)) * sinh((2*m+1)*l);
  end
  for m=1 : 30
    sig02=sig02+(-1)^m * q^(m^2) * cosh(2*m*l);
  end
  sig0=abs((2*q^(1/4)*sig01)/(1+2*sig02));

  w=sqrt((1+k*sig0^2)*(1+sig0^2/k));
  //
  if modulo(n,2)
    r=(n-1)/2;
  else
    r=n/2;
  end
  //
  wi=zeros(1,r);
  for ii=1 : r
    if modulo(n,2)
      mu=ii;
    else
      mu=ii-1/2;
    end
    soma1=0;
    for m=0 : 30
      soma1 = soma1 + 2*q^(1/4) * ((-1)^m * q^(m*(m+1)) * sin(((2*m+1)*%pi*mu)/n));
    end
    soma2=0;
    for m=1 : 30
      soma2 = soma2 + 2*((-1)^m * q^(m^2) * cos((2*m*%pi*mu)/n));
    end
    wi(ii)=(soma1/(1+soma2));
  end
  //
  Vi=sqrt((1-(k.*(wi.^2))).*(1-(wi.^2)/k));
  A0i=1./(wi.^2); A0i = A0i' ;
  sqrA0i=1./(wi);
  B0i=((sig0.*Vi).^2 + (w.*wi).^2)./((1+sig0^2.*wi.^2).^2);
  B1i=(2 * sig0.*Vi)./(1 + sig0^2 * wi.^2);

  // Gain T0:
  if modulo(n,2)
    T0=sig0*prod(B0i./A0i)*sqrt(ws);
  else
    T0=10^(-0.05*Rp)*prod(B0i./A0i);
  end

  // zeros:
  zer=[%i*sqrA0i, -%i*sqrA0i];

  // poles:
  pol=[(-2*sig0*Vi+2*%i*wi.*w)./(2*(1+sig0^2*wi.^2)), (-2*sig0*Vi-2*%i*wi.*w)./(2*(1+sig0^2*wi.^2))];

  // If n odd, there is a real pole  -sig0:
  if modulo(n,2)
    pol=[pol, -sig0];
  end

  //
  pol=(sqrt(ws)).*pol;
  zer=(sqrt(ws)).*zer;

endfunction

// usage: ws = __ellip_ws(n, rp, rs)
// Calculate the stop band edge for the Cauer filter.

function ws=__ellip_ws(n, rp, rs)

  kl0 = ((10^(0.1*rp)-1)/(10^(0.1*rs)-1));
  k0  = (1-kl0);
  
  inte = %k([kl0 ; k0]); 
  ql0 = inte(1);
  q0  = inte(2);
  
//  if kl0 == 1 then
//      ql0 = %inf ;
//  else
//      ql0 = %k(kl0);
//  end
//  
//  if k0 == 1 then
//      q0 = %inf ;
//  else
//      q0 = %k(k0) ;
//  end
  
  x   = n*ql0/q0;
  //kl  = fminbnd(@(y) __ellip_ws_min(y,x) ,eps, 1-eps); //works on octave
  kl  = fminsearch(list(__ellip_ws_min, x) ,(%eps+1-%eps)/2);
  ws  = sqrt(1/kl);

endfunction

// usage: err = __ellip_ws_min(kl, x)

function err=__ellip_ws_min(kl, x)

  inte=%k([kl; 1-kl]);
  ql=inte(1);
  q=inte(2);
//  if kl == 1 then
//      ql = %inf ;
//      q = %k(kl-1);
//  elseif kl == 0
//      ql = %k(kl-1);
//      q = %inf ;
//  else
//      [ql q] = %k([kl; 1-kl])
//  end
  
  err=abs((ql/q)-x);

endfunction
