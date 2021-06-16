function []=  display_match_new(Ia, Ib, matches, fa, fb)
  if size(Ia,3)==1
    Ia=cat(3,Ia,Ia,Ia);
   else
    Ia=Ia;
  end
  if size(Ib,3)==1
    Ib=cat(3,Ib,Ib,Ib);
   else
    Ib=Ib;
  end
if size(Ia,2)> size(Ib,2)
    factor=size(Ia,2)/size(Ib,2); 
    Ib=imresize(Ib, [size(Ib,1)*factor, size(Ia,2)]);
else
    factor=size(Ia,2)/size(Ib,2);
    Ib=imresize(Ib, [size(Ib,1)*factor, size(Ia,2)]);
end
figure;
interval = 20;
 WhiteInterval = 255*ones(interval,size(Ia,2),3);
imagesc(cat(1, Ia, WhiteInterval, Ib)) ;
xa = fa(1,matches(1,:)) ;
xb = factor*fb(1,matches(2,:)) ;
ya = fa(2,matches(1,:)) ;
yb = factor*fb(2,matches(2,:)) +interval+size(Ia,1) ;
hold on ;
h = line([xa ; xb], [ya ; yb]) ;
set(h,'linewidth', 1, 'color',[0,0.67,0]) ;
set(gca,'looseInset',[0 0 0 0])
axis image off ;