
#import "data.typ"

#let get_h(height, over-marge:false, full-page:false, placement:bottom) = {
  if type(height) == ratio {
    (
      height
        * if over-marge {
          if full-page {
              data.projets.data.page.height
          } else if placement == top {
              data.projets.data.page.height - data.data.emarge-full.bottom
          } else if placement == bottom {
              data.projets.data.page.height - data.emarge-full.top
          }
        } else {
         data.projets.data.page.height - data.emarge-soft.top - data.emarge-soft.bottom - 6pt
        }
    )
  } else {
    height
  }
}


