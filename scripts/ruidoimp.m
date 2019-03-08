## Copyright (C) 2019 Hegar Garcia
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {} {@var{retval} =} ruidoimp (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Hegar Garcia <hjgr@hegar-pc>
## Created: 2019-03-06

function [out] = ruidoimp (image, probability, min, max)
  [rows, columns] = size(image);
  
  image = double(image);
  pixel_affected_count = ceil(probability * rows * columns);
  
  turn = 0;
  out = image;
  
  for pixel_index = 1:pixel_affected_count
    k = ceil(rows * rand);
    l = ceil(columns * rand);
    
    if turn == 0
      turn = 1;
      out(k, l) = max;
    else
      turn = 0;
      out(k,l) = min;
    end
  end
  
  out = uint8(out);
endfunction
