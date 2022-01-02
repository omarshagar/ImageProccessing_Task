function [val]= valueOfImage(img,allimages)
H=360;
W=700;

% img=imresize(img,[H W]);
 imvec=imageToVector(img);
% flt=fspecial('average',[5 5]);
% img=imfilter(img,flt);
mn=370;
id=-1;
for i= 1 :size(allimages.val,2)
tmp=abs(vector2angle(imvec,allimages.vec(:,i)));
if tmp<mn 
    mn=tmp;
    id=i;
end
end
mn
val=allimages.val(id);
val
end


