<<<<<<< HEAD
//Calling sequence:
//  y = upsample (x, n)
//  y = upsample (x, n, offset)
// Upsample the signal, inserting n-1 zeros between every element.
//
// If x is a matrix, upsample every column.
//
// If offset is specified, control the position of the inserted sample in
// the block of n zeros.
// 

//Testcases:
//1.upsample([1,3,5],2)
//EXPECTED OUTPUT:[1,0,3,0,5,0]


//2.upsample([1;3;5],2)
//EXPECTED OUTPUT:[1;0;3;0;5;0]


//3.upsample([1,2;5,6;9,10],2)
//EXPECTED OUTPUT:[1,2;0,0;5,6;0,0;9,10;0,0]
//
//



function y = upsample (x,n,phase )
  [nargout,nargin]=argn()
  
  if (nargin<2 | nargin>3),
        error("wrong no. of input arguments")
        end
if nargin==2
    phase=0;
    else
  if phase > n-1
    warning("This is incompatible with Matlab (phase = 0:n-1). See octave-forge signal package release notes for details." )
  end
end

  [nr,nc] = size(x);
  if (nc==1 | nr==1) then
  
  if ( nc==1)
    y = zeros(n*nr*nc,1);
   y(phase+1:n:$) = x;
   end
    if (nr==1) 
         y = zeros(n*nr*nc,1);
        y(phase+1:n:$) = x';
        y = y.'; 
        end
  else
    y = zeros(n*nr,nc);
    y(phase + 1:n:$,:) = x;
  end

endfunction
=======
function y = upsample (x, n, phase)
//This function upsamples the signal, inserting n-1 zeros between every element.
//Calling Sequence
//y = upsample (x, n)
//y = upsample (x, n, phase)
//Parameters 
//x: scalar, vector or matrix of real or complex numbers
//n: real number or vector
//phase: integer value, 0 <= phase <= (n - 1 ), default value 0, or logical
//Description
//This is an Octave function.
//This function upsamples the signal, inserting n-1 zeros between every element. If x is a matrix, every column is upsampled.
//The phase determines the position of the inserted sample in the block of zeros. The default value is 0.
//Examples
//upsample(4,5,2)
//ans  =
//    0.    0.    4.    0.    0.

funcprot(0);
rhs = argn(2)
if(rhs<2 | rhs>3)
error("Wrong number of input arguments.")
end  

	select(rhs)
	case 2 then
	y = callOctave("upsample",x,n)
	case 3 then
	y = callOctave("upsample",x,n,phase)
	end

endfunction

>>>>>>> 6bbb00d0f0128381ee95194cf7d008fb6504de7d
