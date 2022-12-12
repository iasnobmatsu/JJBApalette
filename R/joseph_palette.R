
joseph.colors <- list(
        "anime" =  c("#795D4A",
                     "#1E2722",
                     "#36637C",
                     "#4F8A27",
                     "#8F9F5E",
                     "#60B799",
                     "#F9E47F"),
        "manga" = c("#3F246B",
                    "#865AAA",
                    "#E3DD6E",
                    "#87743E",
                    "#874D35",
                    "#2D856E")
)


#' joseph palette
#'
#' This function makes a palette based on the colors of joseph Cujoh
#' @param n number of colors
#' @param name anime or manga
#' @param type discrete or continuous
#' @return an object of class palette
#' @export
joseph_palette = function(n, name="anime", type = c("discrete", "continuous")) {
  palette = joseph.colors[[name]]
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

#' scale color joseph
#'
#' This function specifies color using the joseph palette
#' @param type discrete or continuous
#' @param name anime or manga
#' @return a scale color function
#' @export
scale_color_joseph= function(name="anime", type="continuous") {
  if (type=="discrete"){
    ggplot2::scale_color_manual(values = joseph_palette(name=name, type = "discrete"))
  }else if (type=="continuous"){
    ggplot2::scale_color_gradientn(colors = joseph_palette(name=name,type = "continuous"))
  }
}

#' scale fill joseph
#'
#' This function specifies fill using the joseph palette
#' @param type discrete or continuous
#' @param name anime or manga
#' @return a fill color function
#' @export
scale_fill_joseph= function(name="anime", type="continuous") {
  if (type=="discrete"){
    ggplot2::scale_fill_manual(values = joseph_palette(name=name, type = "discrete"))
  }else if (type=="continuous"){
    ggplot2::scale_fill_gradientn(colors = joseph_palette(name=name, type = "continuous"))
  }
}







