"# php-docker"
       
   # Use root/example as user/password credentials
    version: '3.1'

    volumes:
        php-web-pool:

    services:

      mongo:
        image: mongo
        restart: always
        environment:
          MONGO_INITDB_ROOT_USERNAME: root
          MONGO_INITDB_ROOT_PASSWORD: example
      web_php:
        image: francxpt/php-7.4:main
        ports:
          - 9451:80
        restart: always
        volumes:
          - /home/mongosftp:/var/www/html/
      sftp:
        image: netresearch/sftp
        volumes:
            - /home/mongosftp:/home/root/upload
        ports:
          - "9922:22"
        command: root:example:1001
        networks:
          - turreta_network     

      mongo-express:
        image: mongo-express
        restart: always
        ports:
          - 8089:8081
        environment:
          ME_CONFIG_MONGODB_ADMINUSERNAME: root
          ME_CONFIG_MONGODB_ADMINPASSWORD: example
          ME_CONFIG_MONGODB_URL: mongodb://root:example@mongo:27017/


    networks:
      turreta_network:
        driver: bridge
