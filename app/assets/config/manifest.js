// Contenido corregido para: app/assets/config/manifest.js

//= link_tree ../images
//= link_directory ../stylesheets .css

// Esta es la línea correcta para un proyecto con jsbundling-rails.
// Le dice a Rails que busque los archivos JS compilados en la carpeta /builds.
//= link_tree ../builds 

//= link_tree ../../../vendor/javascript .js

//= link application.js