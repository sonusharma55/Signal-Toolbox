<<<<<<< HEAD

//Function File vary = downsample (x, n)
//Function File y = downsample (x, n, offset)
// Downsample the signal, selecting every nth element.  If x
// is a matrix, downsample every column.
//
// If offset is defined, select every nth element starting at
// sample offset.
// 
//

//Test cases:

//1.downsample([1,2,3,4,5],2)
//EXPECTED OUTPUT:[1,3,5]


//2.downsample([1;2;3;4;5],2)
//EXPECTED OUTPUT:[1;3;5]


//3.downsample([1,2;3,4;5,6;7,8;9,10],2)
//EXPECTED OUTPUT:[1,2;5,6;9,10]


//4.downsample([1,2,3,4,5],2,1)
//EXPECTED OUTPUT:[2,4]


//5.downsample([1,2;3,4;5,6;7,8;9,10],2,1)
//EXPECTED OUTPUT:[3,4;7,8]



function y = downsample (x, n, phase)
[nargout,nargin]=argn();
  if (nargin<2 | nargin>3) 
       error ("wrong no. of input arguments"); 
       end

if nargin==2
    phase=0;
    else
  if phase > n-1
    warning("This is incompatible with Matlab (phase = 0:n-1). See octave-forge signal package release notes for details." )
  end
end

  if isvector(x)
    y = x(phase + 1:n:$);
  else
    y = x(phase + 1:n:$,:);
  end

endfunction


=======
function y = downsample (x, n, phase)
//This function downsamples the signal by selecting every nth element.
//Calling Sequence
//y = downsample (x, n)
//y = downsample (x, n, phase)
//Parameters 
//x: scalar, vector or matrix of real or complex numbers
//n: real number or vector
//phase: integer value, 0 <= phase <= (n - 1), default value 0, or logical
//Description
//This is an Octave function.
//This function downsamples the signal by selecting every nth element supplied as parameter 2. If x is a matrix, the function downsamples every column.
//If the phase is specified, every nth element is selected starting from the sample phase. The default phase is 0.
//Examples
//downsample([1,2,4],2)
//ans  =
//    1.    4.  

funcprot(0);
rhs = argn(2)
if(rhs<2 | rhs>3)
error("Wrong number of input arguments.")
end
  
	select(rhs)
	case 2 then
	y = callOctave("downsample",x,n)
	case 3 then
	y = callOctave("downsample",x,n,phase)
	end
endfunction
>>>>>>> 6bbb00d0f0128381ee95194cf7d008fb6504de7d
