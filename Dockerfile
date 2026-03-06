version: "3.8"

services:
  frontend:
    image: chandu554/duni:v1.1.0
    container_name: Retail-app12
    networks:
      - frontend-net
    depends_on:
      - nginx-gateway

  backend:
    image: mysql:8.0
    container_name: mysql-cont12
    volumes:
      - mysql_data:/var/lib/mysql
    env_file:
      - .env
    networks:
      - backend-net

  nginx-gateway:
    image: nginx:latest
    container_name: nginx-gateway
    ports:
      - "80:80"
    volumes:
      - ./nginx/nginx.conf:/etc/nginx/nginx.conf:ro
    networks:
      - frontend-net
      - backend-net
    depends_on:
      - frontend
      - backend

volumes:
  mysql_data:

networks:
  frontend-net:
    driver: bridge
  backend-net:
    driver: bridge
