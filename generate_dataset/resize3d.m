function imgs_L = resize3d(imgs, scale, method, verbose)

if nargin < 4
    verbose = 0;
end

h = [];
if verbose
    fprintf('Scaling %d images by %.2f (%s) ', numel(imgs), scale, method);
end

levels = size(imgs);
levels_x=levels(1);
levels_y=levels(2);
levels_z=levels(3);

level_L=1;
for i=1:scale:levels_z
   % h = progress(h, i/numel(imgs), verbose);
   x_image=imgs(:,:,i);
   x_image_H=reshape(x_image,levels_x,levels_y);%��������Ǹ���İ���������������飨����ı��Σ�����Ԫ�صĸ������䣬�����СΪlevels_x��levels_xy�С��������������ô
    x_image_L= imresize(x_image_H, 1/scale, method);
    imgs_L(:,:,level_L) = x_image_L;
    level_L= level_L+1;
end
if verbose
    fprintf('\n');
end
