docker run -it --rm --name zilliz_search_images_demo \
-v /Users/adamnall/Desktop/code/FaceRecDatasets/random/1:/tmp/pic1 \
-v /Users/adamnall/Desktop/code/FaceRecDatasets/random/2:/tmp/pic2 \
-p 35000:5000 \
-e "DATA_PATH=/tmp/images-data" \
-e "MILVUS_HOST=host.docker.internal" \
-e "MILVUS_PORT=19530" \
-e "FLASK_ENV=development" \
-e "FLASK_DEBUG=1" \
milvusbootcamp/pic-search-webserver:0.7.0

installed pymilvus 0.2.12, changed urls, port forwarded 19530
port-forward pod/milvus-7969488d9c-grnj6 19530:19530

docker run --name zilliz_search_images_demo_web -it --rm -p 8001:80 \
-e API_URL=http://10.1.10.75:35000 \
milvusbootcamp/pic-search-webclient:0.1.0