#- ENTREGA nº 08
#---- Pon tus datos de identificación ------------------------------------------
#- Apellidos: Lloret Quero
#- Nombre: Jesus 
#- e-mail: jelloque@alumni.uv
#- NPA: 
# -----------------------------------------------------------------------------.
#- Para entregar tus tareas, graba esta plantilla en un script (archivo .R)
#- Evidentemente, incorpora (en los huecos que hay) las soluciones a las tareas
#- No te olvides de rellenar los datos de identificación
# -----------------------------------------------------------------------------.
#- Solo has de subir al uploader el fichero .R (solo el fichero .R, sin comprimir)
#- Repito, no hay que subir el Rproject, hay que subir solo el fichero .R (sin comprimir)
#- El fichero .R  se ha de llamar entrega_08_perez_pedro_GG445566.R
# -----------------------------------------------------------------------------.



#- Objetivo: practicar un poco gráficos con ggplot2 
library(tidyverse)
library(ggplot2)
gapminder <- gapminder::gapminder
#- PRIMERA TAREA: --------------------------------------------------------------
#- utiliza el data.frame gapminder del paquete gapminder para hacer un gráfico de puntos de la variable "gdpPercap" (en el eje X) frente a la variable "lifeExp". Utiliza sólo los datos del último año (2007)
#- Recuerda que las variables que quieras q se muestren en el gráfico van dentro de aes()
#- has de cargar librerias, "arreglar" los datos y después hacer el gráfico




df <- gapminder %>% filter(year == "2007") %>% 
  select(gdpPercap, lifeExp)


p1 <- ggplot() +
  geom_point(data = df, aes(gdpPercap, lifeExp ))


p1   

#- SEGUNDA TAREA: --------------------------------------------------------------
# haz que el color de los puntos sea diferente en función del continente

df <- gapminder %>% filter(year == "2007") %>% 
  select( continent, gdpPercap, lifeExp)

p2 <- ggplot() +
  geom_point(data = df, aes(gdpPercap, lifeExp, color = continent ))


p2


#- TERCERA TAREA: --------------------------------------------------------------
#- En el mismo gráfico de antes, hay que marcar, hay que hacer que resalten, que se vean mejor los siguientes países: Spain, Poland and Italy
#- Pista: Igual puedes crear un df con solo las observaciones  de esos 3 países y ponerlo encima del gráfico con un color que se vea bien tipo "orange" o con un tamaño grande (7 ya es muy grande) del punto, o las 2 cosas a la vez casí mejor.

df <- gapminder %>% filter(year == "2007") %>% 
  select( continent, gdpPercap, lifeExp)

df2 <- gapminder %>% filter(year == "2007") %>% 
  select(country,continent, gdpPercap, lifeExp) %>%
  filter(country == "Spain" | country == "Poland" | country == "Italy") 

p3 <- ggplot() +
  geom_point(data = df, aes(gdpPercap, lifeExp, color = continent )) +
  geom_point(data = df2, aes(gdpPercap, lifeExp, color = "orange", size = 3 )) +
  theme(legend.position = "none")
  
  
  p3


#- CUARTA TAREA: ---------------------------------------------------------------
# Partiendo del gráfico de la TAREA 2 (p2); es decir, sin que se marquen Spain, Italy y Poland, ahora vamos a añadir (vamos a representar) una cuarta variable en el gráfico. Añade al gráfico la variable "pob" (poblacion), para ello asociala/mapeala a la aesthetic "size"

df <- gapminder %>% filter(year == "2007") %>% 
    select( continent, pop, gdpPercap, lifeExp)
  
p4 <- ggplot() +
    geom_point(data = df, aes(gdpPercap, lifeExp, color = continent, size= pop )) 
 
  
  p4

#- QUINTA TAREA: ---------------------------------------------------------------
#- hay que intentar dejar el gráfico p4 más bonito. Igual tienes que jugar con el parámetro/aesthetic "alpha" que regula la transparencia del color. Aquí Galina tiene ventaja, ya hizo este gráfico en la entrega_06!!

library(ggthemes)

df <- gapminder %>% filter(year == "2007") %>% 
    select( continent, pop, gdpPercap, lifeExp)
  
p5 <- ggplot() +
    geom_point(data = df, aes(gdpPercap, lifeExp, color = continent, size= pop), alpha = 10) +
    theme_solarized()
  
  
  p5


#- SEXTA TAREA: ----------------------------------------------------------------
#- haz un "small multiple" con un gráfico por año
#- Pista: tendrás que mirarlo por tu cuenta en el tutorial y/o slides del curso 😱

  
p6 <- ggplot() +
    geom_point(data = gapminder , aes(gdpPercap, lifeExp, color = continent )) +
    facet_grid(
      rows = vars(year))
  
  p6

#- SEPTIMA TAREA: --------------------------------------------------------------
#- Partiendo del gráfico de la tarea anterior (p6)
#- vamos a mejorar un poco el gráfico. Para ello:
#- Pon título, subtítulo, caption, eje X, eje Y y título de la leyenda

p7  <- ggplot() +
    geom_point(data = gapminder , aes(gdpPercap, lifeExp, color = continent )) +
    facet_grid(rows = vars(year)) +
    labs(title = "Relacion esperanza de vida por PIBpc") +
    labs(subtitle = "Diferenciando por años") +
    labs(caption = "Datos provinientes de Gapminder dataset") +
    labs(x= "PIBpc") +
    labs(y= "Esperanza de vida") +
    labs(color= "Agrupacion por continentes")
    
  
  p7


#- OCTAVA TAREA: ---------------------------------------------------------------
# partiendo del gráfico de la tarea anterior (p7)
#- Haz el gráfico anterior interactivo. Para ello usa plotly::ggplotly()
#- bueno esta es supersencilla. Hay gente que ya pilota plotly
library(plotly)
  
p8  <- ggplot() +
    geom_point(data = gapminder , aes(gdpPercap, lifeExp, color = continent )) +
    facet_grid(rows = vars(year)) +
    labs(title = "Relacion esperanza de vida por PIBpc") +
    labs(subtitle = "Diferenciando por años") +
    labs(caption = "Datos provinientes de Gapminder dataset") +
    labs(x= "PIBpc") +
    labs(y= "Esperanza de vida") +
    labs(color= "Agrupacion por continentes")
  
p8 <- ggplotly(p8)
  
  p8

#- NOVENA TAREA: ---------------------------------------------------------------
#- Es opcional, sólo si te apetece, tienes tiempo y te sale un gráfico con datos de gapminder que vuela o que habla o que es chulo pónmelo aquí please. Seguro que Aurora y Alicja saben hacer un gganimate (!!)


#Si las graficas de ggplot y los memes vistos hasta ahora molan, por que no juntarlo todo en uno???!!!!
#Para esta grafica vamos a ver la evolucion del PIBpc de los 5 continentes representada por gatos.
  
#install.packages("Ecdat")
library(Ecdat)
#install.packages("gganimate")
library(gganimate)
#install.packages("remotes")
#remotes::install_github("R-CoderDotCom/ggcats@main")
library(ggcats)
  
 
# Data frame
dataframe <- gapminder %>%
  select(year,continent ,country, gdpPercap ) %>%
  group_by(year, continent) %>%
  summarise(media_PIBpc = mean(gdpPercap))
  

# Gatos para cada línea
dataframe$cat <- rep(NA, 60)
dataframe$cat[which(dataframe$continent == "Africa")] <- rep(c("pop_close", "pop"), 33)
dataframe$cat[which(dataframe$continent == "Asia")] <- "bongo"
dataframe$cat[which(dataframe$continent == "Americas")] <- "venus"
dataframe$cat[which(dataframe$continent == "Europe")] <- "pusheen"
dataframe$cat[which(dataframe$continent == "Oceania")] <- "nyancat"
  
  
# Animación
p_extra  <- ggplot(dataframe, aes(x = year, y = media_PIBpc, group = continent, color = continent)) +
  geom_line( size = 2) +
  geom_cat(aes(cat = cat), size = 3) + 
  labs(color = "Continentes", size = 10) +
  labs(title = "Evolucion del PIBpc agrupado por continentes") + 
  labs(subtitle = "En el periodo de 1952-2007") +
  labs(caption = "Datos provenientes de gapminder dataset") +
  labs(x= "Tiempo") +
  labs(y= "PIBpc") +
  theme_minimal() +
  theme(legend.title = element_text(size = 20)) +
  theme(legend.text = element_text(size = 15)) +
  transition_reveal(year)
 
p_extra


#PD: se que solo has pedido una grafica voluntaria pero como esto es mas adictivo que cualquier d... me he puesto hacer mas yo la dejo por aqui y si no tienes suficiente tiempo para corregirla sin problemas :). 
#En este caso veremos la evolucion de la relacion de la esperanza de vida con el PIBpc de los paises Europeos y como elemento original es que estos estan representados por su bandera. 

# install.packages(gganimate)
library(gganimate)
#devtools::install_github('rensa/ggflags')
library(ggflags)
#install.packages("gifski")
library(gifski)
library(countrycode)

#Necesito añadir el codigo que relaciona el pais para poder utilizar ggflags

gapminder$code<-tolower(countrycode(gapminder$country,origin = 'country.name', destination = 'iso2c'))

#DataFrame

df <- gapminder %>%
  filter(continent == "Europe") %>%
  select(year, country, gdpPercap, lifeExp, code) %>%
  group_by(year) %>%
  arrange(year)
  
#Grafica 

p_extra2 <- ggplot(df, aes(x=gdpPercap, y=lifeExp, country= code)) +
  theme(text = element_text(size=20)) +
  labs(title = "Evolucion de la relacion de la Esperanza de vida con el PIBpc (1952-2007)") + 
  labs(subtitle = "Año: {closest_state}") +
  labs(caption = "Datos provenientes de gapminder dataset") +
  labs(x= "PIBpc") +
  labs(y= "Esperanza de vida") +
  theme_minimal() +
  geom_flag(size = 10) +
  transition_states(year, transition_length = 1, state_length = 1) 
  
p_extra2



