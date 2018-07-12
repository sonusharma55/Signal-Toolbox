function k=lar2rc(g)
    
//lar2rc convert log area ratios to reflection coefficients.
// Calling Sequence
// k = lar2rc(g)
// Parameters
// g: define log area ratios.
// k: returns the reflection coefficients.
<<<<<<< HEAD

// Example
//g = [0.6389 4.5989 0.0063 0.0163 -0.0163];
//k = lar2rc(g)

// Output  :
//k  =
// 
// 
//         column 1 to 4
// 
//    0.3090095    0.9800747    0.0031500    0.0081498  
// 
//         column 5
// 
//  - 0.0081498  


=======
// Examples
//X = [7 6 5 8 3 6 8 7 5 2 4 7 4 3 2 5 4 9 5 3 5 7 3 9 4 1 2 0 5 4 8 6 4 6 5 3];
// k = lar2rc(X)
// or t=[2 5 6; 8 6 5; 8 9 4]
// k = lar2rc(t)
//
>>>>>>> 6bbb00d0f0128381ee95194cf7d008fb6504de7d
// See also
//
// Author
// Jitendra Singh
//     
//Modified to match MATLAB o/p when i/p is of type char and is a string by Debdeep Dey
  if or(type(g)==10) then
    [r,c]=size(g);
    if r==1 & c==1 then
        k=ones(1,length(g));
    else
        k=ones(size(g,1), size(g,2))
    end
    
else
    if ~isreal(g) then
        error('Log area ratios must be real.')
    end
    k=-(tanh(-g/2));
    end
endfunction
