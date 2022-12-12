
jonathan.colors <- list(
        "anime" =  c("#4E4CB6",
                     "#43486A",
                     "#6E8ECD",
                     "#7F8C8F",
                     "#A38870",
                     "#A86E37",
                     "#B92A93",
                     "#FFFFFF"),
        "manga" = c("#543B31",
                    "#92704C",
                    "#3B66B1",
                    "#72C6C4",
                    "#000000",
                    "#913D41")
)


#' jonathan palette
#'
#' This function makes a palette based on the colors of jonathan Cujoh
#' @param n number of colors
#' @param name anime or manga
#' @param type discrete or continuous
#' @return an object of class palette
#' @export
jonathan_palette = function(n, name="anime", type = c("discrete", "continuous")) {
  palette = jonathan.colors[[name]]
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

#' scale color jonathan
#'
#' This function specifies color using the jonathan palette
#' @param type discrete or continuous
#' @param name anime or manga
#' @return a scale color function
#' @export
scale_color_jonathan= function(name="anime", type="continuous") {
  if (type=="discrete"){
    ggplot2::scale_color_manual(values = jonathan_palette(name=name, type = "discrete"))
  }else if (type=="continuous"){
    ggplot2::scale_color_gradientn(colors = jonathan_palette(name=name,type = "continuous"))
  }
}

#' scale fill jonathan
#'
#' This function specifies fill using the jonathan palette
#' @param type discrete or continuous
#' @param name anime or manga
#' @return a fill color function
#' @export
scale_fill_jonathan= function(name="anime", type="continuous") {
  if (type=="discrete"){
    ggplot2::scale_fill_manual(values = jonathan_palette(name=name, type = "discrete"))
  }else if (type=="continuous"){
    ggplot2::scale_fill_gradientn(colors = jonathan_palette(name=name, type = "continuous"))
  }
}







