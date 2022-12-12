
josuke.colors <- list(
        "anime" =  c("#100E17",
                     "#373F7A",
                     "#2D4280",
                     "#665087",
                     "#DCBF67",
                     "#E6D36C"),
        "manga" = c("#000000",
                    "#4B2E63",
                    "#9065AB",
                    "#879A56",
                    "#BCE74A",
                    "#FBCC0F")
)


#' josuke palette
#'
#' This function makes a palette based on the colors of josuke Cujoh
#' @param n number of colors
#' @param name anime or manga
#' @param type discrete or continuous
#' @return an object of class palette
#' @export
josuke_palette = function(n, name="anime", type = c("discrete", "continuous")) {
  palette = josuke.colors[[name]]
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

#' scale color josuke
#'
#' This function specifies color using the josuke palette
#' @param type discrete or continuous
#' @param name anime or manga
#' @return a scale color function
#' @export
scale_color_josuke= function(name="anime", type="continuous") {
  if (type=="discrete"){
    ggplot2::scale_color_manual(values = josuke_palette(name=name, type = "discrete"))
  }else if (type=="continuous"){
    ggplot2::scale_color_gradientn(colors = josuke_palette(name=name,type = "continuous"))
  }
}

#' scale fill josuke
#'
#' This function specifies fill using the josuke palette
#' @param type discrete or continuous
#' @param name anime or manga
#' @return a fill color function
#' @export
scale_fill_josuke= function(name="anime", type="continuous") {
  if (type=="discrete"){
    ggplot2::scale_fill_manual(values = josuke_palette(name=name, type = "discrete"))
  }else if (type=="continuous"){
    ggplot2::scale_fill_gradientn(colors = josuke_palette(name=name, type = "continuous"))
  }
}







