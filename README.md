# DotaPy Source
El código fuente de página web de DotaPy, sitio dedicado a la escena de Dota 2 en Paraguay.

Se necesita una **Steam Web API Key**, que se puede obtener [aquí](http://steamcommunity.com/dev/apikey).

Para una documentación más completa de lo que se puede hacer con el Steam Web API, pueden ir [aquí](https://lab.xpaw.me/steam_api_documentation.html).

# Qué incluye?
* Librería para manejar SteamIDs (convertir entre diferentes formatos de SteamID)
* Página web responsive (con Foundation 5 como Base)
* Carga manual de partidas (la usábamos para un ránking)
* Carga de noticias.

# Qué podría agregarse?
* Extender la librería de Steam para obtener más datos del Steam Web API.
* Automatizar la carga de partidas de un torneo o las estadísticas de un jugador. El archivo <code>lib/sample.json</code> muestra la URL que se necesita para obtener, por ejemplo, las estadísticas completas de una partida jugada en un torneo.

# Detalles
* Antes de loguearse se necesita crear una Steam Web API Key. La misma debe agregarse en el módulo <code>lib/steam.rb</code>.
* Los administradores se crean manualmente. Cualquier usuario logueado se puede volver admin cambiando el valor <code>admin (boolean)</code> del usuario en la tabla Users.
