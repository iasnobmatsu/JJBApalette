
jolyne.colors <- c("#9DB80C",
                   "#6E9360",
                   "#0057B4",
                   "#FC92D2",
                   "#EEA35D",
                   "#7AE9E7",
                   "#6F7394"
            )


#' jolyne palette
#'
#' This function makes a palette based on the colors of Jolyne Cujoh
#' @param n number of colors
#' @param type discrete or continuous
#' @return an object of class palette
#' @export
jolyne_palette = function(n, type = c("discrete", "continuous")) {
  palette = jolyne.colors
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
#' @return a scale color function
#' @export
scale_color_jolyne= function(type="continuous") {
  if (type=="discrete"){
    ggplot2::scale_color_manual(values = jolyne_palette(type = "discrete"))
  }else if (type=="continuous"){
    ggplot2::scale_color_gradientn(colors = jolyne_palette(type = "continuous"))
  }
}

#' scale fill jolyne
#'
#' This function specifies fill using the jolyne palette
#' @param type discrete or continuous
#' @return a fill color function
#' @export
scale_fill_jolyne= function(type="continuous") {
  if (type=="discrete"){
    ggplot2::scale_fill_manual(values = jolyne_palette(type = "discrete"))
  }else if (type=="continuous"){
    ggplot2::scale_fill_gradientn(colors = jolyne_palette(type = "continuous"))
  }
}







