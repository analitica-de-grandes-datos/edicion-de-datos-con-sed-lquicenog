#
#  LAB: Transformación de archivos con `sed`
#  ================================================
#
#  Una tarea común en Analytics es el procesamiento de archivos en bruto para que puedan 
#  ser usados en otros procesos, donde gran parte de dicho procesamiento corresponde a la 
#  transforamción del formato. Estos archivos suelen tener millones de registros por lo que 
#  la aplicación de procedimientos manuales no es práctica.
#  
#  El archivo `data.csv` contiene una muestra de los archivos generados automáticamente 
#  por un software. El archivo contiene cuatro (4) columnas, donde los valores válidos
#  para los campos son los siguientes:
#  
#  * Columna 1: `DD/MM/AA`.
#  * Columna 2: `A`, `B`, `C`. `\N` indica NULL.
#  * Columna 3: Número entero. `\N` indica NULL.
#  * Columna 4: Número decimal. `\N` indica NULL.
#  
#  
#  Usted debe escribir un script en bash que use sed para que realice 
#  las siguientes acciones:
#    
#  * Convierta el formato de las fechas de DD/MM/YY a YYYY-MM-DD.
#  
#  * Transforme el archivo para que todos los campos nulos aparezcan como `\N`.
#  
#  * Reemplace los `;` por `,`.
#  
#  * Use el `.` para indicar decimales.
#
#  El resultado del script se escribe en pantalla.
#
#  El programa se llamara por el evaluador tal como se indica a continuación:
#
#  $ bash question.sh data.csv > output.csv
#  
#  Rta/
#  2013-03-12,A,1,100.0
#  ...
#  2014-09-01,A,3,100.4
#
#  >>> Escriba su codigo a partir de este punto <<<
#
cat data.csv > datal.csv
sed 's/\([0-9][0-9]\)\/\([0-9][0-9]\)\/\([0-9][0-9]\)/20\3-\2-\1/g' datal.csv > datal1.csv
sed 's/\([0-9]\)\/\([0-9]\)\/\([0-9][0-9][0-9][0-9]\);/\3-0\2-0\1;/g' datal1.csv > datal2.csv
cat datal2.csv |tr '[:lower:]' '[:upper:]'| tr ',' '.'| tr ';' ','>datal3.csv
sed 's/,,/,\\N,/g' datal3.csv>datal4.csv
sed 's/,N/,\\N/g' datal4.csv > datal5.csv
sed 's/\([0-9][0-9][0-9][0-9]\)-\([0-9][0-9]\)-\([0-9][0-9]\),\(\\[A-Z]\),\(\\[A-Z]\),/\1-\2-\3,\4,\5,\\N/g' datal5.csv > datal6.csv
sed 's/\(2014\)-\(05\)-\(12\),\(C\),\(\\[A-Z]\),/\1-\2-\3,\4,\5,\\N/g' datal6.csv > datal7.csv
cat datal7.csv > output.csv
