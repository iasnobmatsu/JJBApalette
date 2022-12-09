
giorno.colors <- list(
        "anime" =  c("#E9D280",
                     "#F6B85A",
                     "#C665BD",
                     "#5178BC",
                     "#41426F",
                     "#83DFA3"),
        "manga" = c("#FFFD53",
                    "#FBC715",
                    "#82C363",
                    "#447D9B",
                    "#213278",
                    "#AE3655")
)


#' giorno palette
#'
#' This function makes a palette based on the colors of giorno Cujoh
#' @param n number of colors
#' @param name anime or manga
#' @param type discrete or continuous
#' @return an object of class palette
#' @export
giorno_palette = function(n, name="anime", type = c("discrete", "continuous")) {
  palette = giorno.colors[[name]]
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

#' scale color giorno
#'
#' This function specifies color using the giorno palette
#' @param type discrete or continuous
#' @param name anime or manga
#' @return a scale color function
#' @export
scale_color_giorno= function(name="anime", type="continuous") {
  if (type=="discrete"){
    ggplot2::scale_color_manual(values = giorno_palette(name=name, type = "discrete"))
  }else if (type=="continuous"){
    ggplot2::scale_color_gradientn(colors = giorno_palette(name=name,type = "continuous"))
  }
}

#' scale fill giorno
#'
#' This function specifies fill using the giorno palette
#' @param type discrete or continuous
#' @param name anime or manga
#' @return a fill color function
#' @export
scale_fill_giorno= function(name="anime", type="continuous") {
  if (type=="discrete"){
    ggplot2::scale_fill_manual(values = giorno_palette(name=name, type = "discrete"))
  }else if (type=="continuous"){
    ggplot2::scale_fill_gradientn(colors = giorno_palette(name=name, type = "continuous"))
  }
}







