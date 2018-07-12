<<<<<<< HEAD
//Function y=upfirdn(xin,h,p,q)
//
//this function upsamples the input data xin by factor "p", filters it using fiter coefficients "h" and the downsamples this filtered data by a factor "q".
//Esentially it is a cascade of three processes:
//1)Upsampling(Interpolation)
//2)Filtering
//3)Downsampling(Decimation)


//Test cases:

//1.yout=upfirdn (1:100, 1, 1, 1)
//Expected output: yout=1:100

//2.yout=upfirdn (1:100, 1, 1, 2)
//Expected outut: yout=1:2:100




function yout = upfirdn(xin,h,p,q)

[nargout,nargin]=argn();

if(nargin < 2)
		error("usage : yout = upfirdn(xin,h,p,q)");
	end
	
	if(nargin < 3)
		p = 1;
		q = 1;
	end
	
	if(nargin < 4)
		q = 1;
	end
	
	if(floor(p) ~= p | floor(q) ~= q | p < 1 | q < 1)
		error('p and q must be positive integer');
	end
	
	yout = upsample(xin,p);
	yout = filter(h,1,yout);
	yout = downsample(yout,q);
=======
function y = upfirdn (x, h, p, q)
//This function upsamples the input data, applies the FIR filter and then downsamples it.
//Calling Sequence
//y = upfirdn (x, h, p, q)
//Parameters 
//x:
//h:
//p:
//q:
//Description
//This is an Octave function.
//This function upsamples the input data in the matrix by a factor of n. Then the upsampled data is FIR filtered. After this, the resultant is downsampled.
//Examples
//upfirdn([1,2,3],2,3,5)
//ans  =
//
//    2.    0. 
funcprot(0);
rhs = argn(2)
if(rhs~=4)
error("Wrong number of input arguments.")
end

y = callOctave("upfirdn",x, h, p, q)
>>>>>>> 6bbb00d0f0128381ee95194cf7d008fb6504de7d

endfunction
