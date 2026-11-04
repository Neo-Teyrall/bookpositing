
#import "data.typ"


#let get_h2(height, marge: "main", full-page: false, placement: bottom) = {
 
  if type(height) == ratio {
      let text-height = height * (page.height - page.margin.top - page.margin.bottom)
    if full-page {
      if marge == "main" {
          (text-height, text-height )
      } else if marge == "second" {
          (text-height, ( text-height
          + (page.margin.top - data.second-marge.get().even.top)
          + (page.margin.bottom - data.second-marge.get().even.bottom)))
      } else if marge == "none" {
          (text-height, text-height + page.margin.top + page.margin.bottom + (page.bleed * 2))
      }
    } else {
      if marge == "main" {
        if placement == top {
          (text-height, text-height)
        } else if placement == bottom {
            (text-height, text-height)
        }
      } else if marge == "second" {
        if placement == top {
          (text-height, text-height + (page.margin.top -data.second-marge.get().even.top))
        } else if placement == bottom {
            (text-height, text-height + (page.margin.top -data.second-marge.get().even.bottom))
        }
      } else if marge == "none" {
        if placement == top {
            (text-height, text-height + page.margin.top + page.bleed)
        } else if placement == bottom {
            (text-height, text-height + page.margin.bottom + page.bleed)
        }
      }
    }
  } else {
      // version temporaire
    (height,height)
  }
}

#let get_h(height, over-marge: false, full-page: false, placement: bottom) = {
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


