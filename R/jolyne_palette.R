
jolyne.colors <- list(
        "anime" =  c("#A7D483",
                   "#BCB14D",
                   "#607D48",
                   "#3E615A",
                   "#5859CB",
                   "#139EA5",
                   "#94CAFE",
                   "#FEC175",
                   "#E880C6"),
        "manga" = c("#CDE04C",
                    "#0659AB",
                    "#010101",
                    "#EBEFFA",
                    "#E394BF")
)


#' jolyne palette
#'
#' This function makes a palette based on the colors of Jolyne Cujoh
#' @param n number of colors
#' @param name anime or manga
#' @param type discrete or continuous
#' @return an object of class palette
#' @export
jolyne_palette = function(n, name="anime", type = c("discrete", "continuous")) {
  palette = jolyne.colors[[name]]
  if (missing(n)) {
    n = length(palette)
  }
  type = match.arg(type)
  out = switch(type,
               continuous = grDevices::colorRampPalette(palette)(n),
               discrete = palette[1:n]
  )
  structure(out, class = "palette")
}

#' scale color jolyne
#'
#' This function specifies color using the jolyne palette
#' @param type discrete or continuous
#' @param name anime or manga
#' @return a scale color function
#' @export
scale_color_jolyne= function(name="anime", type="continuous") {
  if (type=="discrete"){
    ggplot2::scale_color_manual(values = jolyne_palette(name=name, type = "discrete"))
  }else if (type=="continuous"){
    ggplot2::scale_color_gradientn(colors = jolyne_palette(name=name,type = "continuous"))
  }
}

#' scale fill jolyne
#'
#' This function specifies fill using the jolyne palette
#' @param type discrete or continuous
#' @param name anime or manga
#' @return a fill color function
#' @export
scale_fill_jolyne= function(name="anime", type="continuous") {
  if (type=="discrete"){
    ggplot2::scale_fill_manual(values = jolyne_palette(name=name, type = "discrete"))
  }else if (type=="continuous"){
    ggplot2::scale_fill_gradientn(colors = jolyne_palette(name=name, type = "continuous"))
  }
}







