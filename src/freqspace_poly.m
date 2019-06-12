function varargout = freqspace_poly(varargin)

  if nargin==1 && nargout==2 % [f1,f2] = freqspace(n)
    n = varargin{1};

    if mod(n,2)==0 % n is even
      varargout{1} = [-n:2:n-2]/n;
      varargout{2} = [-n:2:n-2]/n;
    else % n is odd
      varargout{1} = [-n+1:2:n-1]/n;
      varargout{2} = [-n+1:2:n-1]/n;
    end

  elseif nargin==1 && nargout==1 % f = freqspace(N)
    N = varargin{1};
    varargout{1} = (0:2/N:1);

  elseif nargin==2 && nargout==1 % f = freqspace(N,'whole')
    N = varargin{1};
    if ~ischar(varargin{2}) || ~strcmpi(varargin{2},'whole')      
      error('The correct syntax is f = freqspace(N,''whole'')');
    else
      varargout{1} = 0:2/N:2*(N-1)/N;
    end

  else  
    disp('Case not yet implemented.')
    return
  end
endfunction