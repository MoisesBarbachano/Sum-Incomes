# Carga de Ingresos

Instalación de aplicación y ejecución

Pasos a seguir:

* Clonar la rama principal "main"

* Cambiar dentro de "config/database.yml" los registros username y password por los correspondientes a su Base de Datos.

* Ejecutar en la consola: "yarn install --check-files" para verificar y actualizar cualquier archivo necesario con yarn.

* Ejecutar en la consola: "rails db:create" para generar la base de datos con MySQL.

* Ejecutar en la consola  "rails db:migrate" para ejecutar las migraciones (crear tablas y añadir columnas a tablas).

* Realizar las pruebas RSPEC en la consola: "bundle exec rspec"

* Iniciar la aplicación con "rails s"

* Acceder a la dirección "localhost:3000"

* Se podrá cargar el archivo .tab y se mostrarán los ingresos totales.
