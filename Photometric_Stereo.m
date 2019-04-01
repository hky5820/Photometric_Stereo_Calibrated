function [image_albedo, normal_surface] = Photometric_Stereo(imarray, lightdirs)

%% Get E
size_image = size(imarray);
image = reshape(imarray, [size_image(1)*size_image(2) size_image(3)]);
image = image';

%% Calculate normal : E = (albedo)*normal*lightdir
normal = lightdirs \ image;
normal = normal';
normal = reshape(normal, [size_image(1) size_image(2) 3]);

%% albedo & normal calculation
image_albedo = (normal(:,:,1).^2 + normal(:,:,2).^2+ normal(:,:,3).^2).^0.5;
normal_surface = normal./repmat(image_albedo,[1 1 3]);