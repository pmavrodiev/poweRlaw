#' @rdname dist_cdf-methods
#' @aliases dist_cdf,displ-method
setMethod("dist_cdf",
          signature = signature(m="displ"),
          definition = function(m, 
                                q=NULL, 
                                lower.tail=TRUE,
                                cumulative=FALSE) {
              inter = m$internal
              if(cumulative) {
                  xmin = m$xmin
                  alpha = m$pars
                  xmax = max(m$pl_data$x)
                  cumsum((((xmin:xmax)^-alpha))/(inter[["constant"]] - sum((1:(xmin-1))^-alpha)))
              } else if(is.null(q)) {
                  q = m$pl_data$x
                  ppldis(q[q >= m$xmin], m$xmin, m$pars, lower.tail)
              } else {
                  ppldis(q[q >= m$xmin], m$xmin, m$pars, lower.tail)
              } 
          }
          
)

setMethod("dist_cdf",
          signature = signature(m="conpl"),
          definition = function(m, 
                                q=NULL, 
                                lower.tail=TRUE,
                                cumulative=FALSE) {
            if(cumulative) {
              xmin = m$xmin
              alpha = m$pars
              xmax = max(m$pl_data$x)
              1 - (xmin:xmax/xmin)^(-alpha + 1)
            } else if(is.null(q)) {
              q = m$pl_data$x
              pplcon(q[q >= m$xmin], m$xmin, m$pars, lower.tail)
            } else {
              pplcon(q[q >= m$xmin], m$xmin, m$pars, lower.tail)
            }
          }
)

