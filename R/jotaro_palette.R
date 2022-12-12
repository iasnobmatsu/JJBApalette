
jotaro.colors <- list(
        "anime" =  c("#000000",
                     "#494238",
                     "#7B806A",
                     "#56ABA8",
                     "#0C9080",
                     "#BA6257",
                     "#D7A953"),
        "manga" = c("#000000",
                    "#0432D4",
                    "#3A6BCA",
                    "#77B0C7",
                    "#44947E",
                    "#B261E2",
                    "#7F2D44",
                    "#DBBE37")
)


#' jotaro palette
#'
#' This function makes a palette based on the colors of jotaro Cujoh
#' @param n number of colors
#' @param name anime or manga
#' @param type discrete or continuous
#' @return an object of class palette
#' @export
jotaro_palette = function(n, name="anime", type = c("discrete", "continuous")) {
  palette = jotaro.colors[[name]]
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

#' scale color jotaro
#'
#' This function specifies color using the jotaro palette
#' @param type discrete or continuous
#' @param name anime or manga
#' @return a scale color function
#' @export
scale_color_jotaro= function(name="anime", type="continuous") {
  if (type=="discrete"){
    ggplot2::scale_color_manual(values = jotaro_palette(name=name, type = "discrete"))
  }else if (type=="continuous"){
    ggplot2::scale_color_gradientn(colors = jotaro_palette(name=name,type = "continuous"))
  }
}

#' scale fill jotaro
#'
#' This function specifies fill using the jotaro palette
#' @param type discrete or continuous
#' @param name anime or manga
#' @return a fill color function
#' @export
scale_fill_jotaro= function(name="anime", type="continuous") {
  if (type=="discrete"){
    ggplot2::scale_fill_manual(values = jotaro_palette(name=name, type = "discrete"))
  }else if (type=="continuous"){
    ggplot2::scale_fill_gradientn(colors = jotaro_palette(name=name, type = "continuous"))
  }
}







