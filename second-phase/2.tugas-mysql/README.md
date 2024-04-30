## Setup MySQL on Docker Compose

* Jalankan perintah berikut untuk menjalankan service MySQL
    ```bash
    docker compose up -d
    ```

* Modifikasi file `/docker/mysql/mysql.env` untuk mengganti nama database dan root password
    ```bash
    mysql.env
  
    MYSQL_DATABASE=repairment_ac
    MYSQL_ROOT_PASSWORD=developer
    ```

* Jalankan perintah berikut untuk mematikan service MySQL
    ```bash
    docker compose down
    ```