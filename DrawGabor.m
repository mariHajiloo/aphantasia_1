function Gabor = DrawGabor(StimSz,Frequency,Contrast,Orientation,ppd)

%StimSz is in pixel from view distance and resolution and monitor size

pxHalf  = StimSz/2;
period  = ppd/Frequency;
gsigma  = pxHalf/2*.75;%period*.75;%
f       = 1/period;
c       = Contrast;
%o       = Orientation*2-1;
o       = Orientation;
%theta   = 45*pi/180; 
theta   = o*pi/180;
phase   = 2*pi*rand;

[x,y]   = meshgrid(-pxHalf:(pxHalf-1), -pxHalf:(pxHalf-1));

Gaussian    = 10.^(-(x.^2 + y.^2)/2/gsigma^2);
%Grating     = sin(phase+2.0*pi*f.*(sin(theta)*y+o.*cos(theta)*x));
Grating     = sin(phase+2.0*pi*f.*(sin(theta)*y+cos(theta)*x));
Gabor       = Gaussian.*Grating*c;