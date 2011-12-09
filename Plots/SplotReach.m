function h = SplotReach(Sys, S, timespan, facecolor, edgecolor, alph, maxf)
%  Plots the reachable set as estimated using sensitivity matrices (works
%  only in 2D and 3D) 
% 
%  Usage:
%         h = SplotReach(Sys, S, timespan, facecolor, alpha)
%
  
  if (~exist('alph'))
    alph=.1;
  end
  
  if (~exist('facecolor'))
    facecolor= 'none';
  end
  
  if (~exist('edgecolor')||isempty(edgecolor))
    edgecolor = 'k';
  end 
  
  if (~exist('maxf'))
   maxf=10000;
  end
  
  switch (S.DimX)
  
   case 2
%    SplotBoxPts(S,[],[],[], facecolor, alph);
    SplotPts(S,[1 2]);
    fv = SPolygon2d(Sys,S,timespan);
%    nfv = reducepatch(fv,maxf) 
    
    p = patch(fv);
    
    set(p,'facecolor',facecolor,'edgecolor',edgecolor);    
    alpha(alph);
    
   case 3
    
    %    SplotBoxPts(S,[],[],[], facecolor, alph);
    SplotPts(S, [1 2 3]);
    fv = SPolygon3d(Sys,S,timespan)
%    nfv = reducepatch(fv,maxf)
    p = patch(fv);
    set(p,'facecolor',facecolor,'edgecolor', edgecolor);    
    alpha(alph);        
   
   otherwise 
    error('Only works for 2D and 3D systems so far');
  end
  
  h = gcf;
  set(h, 'Visible', 'on');
  
  
  