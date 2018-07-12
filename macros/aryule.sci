<<<<<<< HEAD
//This function fits an AR (p)-model with Yule-Walker estimates.

=======
function [a, v, k] = aryule (x, p)
//This function fits an AR (p)-model with Yule-Walker estimates.
>>>>>>> 6bbb00d0f0128381ee95194cf7d008fb6504de7d
//Calling Sequence
//a = aryule (x, p)
//[a, v] = aryule (x, p)
//[a, v, k] = aryule (x, p)
<<<<<<< HEAD

//Parameters 
//x: vector of real or complex numbers, length > 2
//p: positive integer value < length(x) - 1
//a: gives the AR coefficients
//v: gives the variance of the white noise, 
//k: gives the reflection coefficients to be used in the lattice filter

//Description
//This function fits an AR (p)-model with Yule-Walker estimates.
//The first argument is the data vector which is to be estimated. 

=======
//Parameters 
//x: vector of real or complex numbers, length > 2
//p: positive integer value < length(x) - 1
//a, v, k: Output variables 
//Description
//This is an Octave function.
//
//This function fits an AR (p)-model with Yule-Walker estimates.
//The first argument is the data vector which is to be estimated. 
//Output variable a gives the AR coefficients, v gives the variance of the white noise and k gives the reflection coefficients to be used in the lattice filter.
>>>>>>> 6bbb00d0f0128381ee95194cf7d008fb6504de7d
//Examples
//aryule([1,2,3,4,5],2)
//ans  =
//    1.  - 0.8140351    0.1192982

<<<<<<< HEAD
//*************************************************************************************
//-------------------version1 (using callOctave / errored)-----------------------------
//*************************************************************************************
//function [a, v, k] = aryule (x, p)
//funcprot(0);
//rhs = argn(2)
//lhs = argn(1)
//
//if(rhs~=2)
//error("Wrong number of input arguments.")
//end
//
//	select(lhs)
//	case 1 then
//	a = callOctave("aryule",x,p)
//	case 2 then
//	[a,v] = callOctave("aryule",x,p)
//	case 3 then
//	[a,v,k] = callOctave("aryule",x,p)
//	end
//
//endfunction

//*************************************************************************************
//-----------------------------version2 (pure scilab code)-----------------------------
//*************************************************************************************

function [a, v, k] = aryule (x, p)
  
  [nargout,nargin] = argn() ;
  
  if ( nargin~=2 )
    error('aryule : invalid number of inputs');
  elseif ( ~isvector(x) | length(x)<3 )
    error( 'aryule: arg 1 (x) must be vector of length >2' );
  elseif ( ~isscalar(p) | fix(p)~=p | p > length(x)-2 )
    error( 'aryule: arg 2 (p) must be an integer >0 and <length(x)-1' );
  end

  c = xcorr(x, p+1, 'biased');
  c(1:p+1) = [];     // remove negative autocorrelation lags
  c(1) = real(c(1)); // levinson/toeplitz requires exactly c(1)==conj(c(1))
  if nargout <= 1
    a = levinson(c, p);
  elseif nargout == 2
    [a, v] = levinson(c, p);
  else
    [a, v, k] = levinson(c, p);
  end
=======
funcprot(0);
rhs = argn(2)
lhs = argn(1)

if(rhs~=2)
error("Wrong number of input arguments.")
end

	select(lhs)
	case 1 then
	a = callOctave("aryule",x,p)
	case 2 then
	[a,v] = callOctave("aryule",x,p)
	case 3 then
	[a,v,k] = callOctave("aryule",x,p)
	end
>>>>>>> 6bbb00d0f0128381ee95194cf7d008fb6504de7d

endfunction
