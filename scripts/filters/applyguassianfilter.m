## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} guassianFilter (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Hegar Garcia <hjgr@hegar-pc>
## Created: 2019-03-03

function [out] = applyguassianfilter (img, sigma)
  [x, y, z] = size(img);
  filter = createGuassianFilter([x, y], sigma);
  out = conv2(img, filter, 'same');
endfunction
