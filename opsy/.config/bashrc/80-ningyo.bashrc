# Fastboot images are easily compressible 2~3 times with gzip. Ningyo supports
# on-the flight gzip compression of images. That is the image is compressed on
# the client side and transparently un-compressed on the server side. That
# should reduce time spent on image upload.

# To activate this feature, set environment variable
# NINGYO_PUSH_COMPRESSED to y or 1-9 (9 is the highest)

export NINGYO_PUSH_COMPRESSED=9
