
#import "data.typ"

#let get_text_width() = {
    page.width - page.margin.left - page.margin.right
}

#let get_text_height() = {
    page.height - page.margin.top - page.margin.bottom
}

#let get_y_shift_marge(marge: "main", placement: top) = {
  if marge == "none" {
    if placement == top {
      (
        data.projets.data.page.margin.top + std.page.bleed,
        -(data.projets.data.page.margin.top + std.page.bleed),
      )
    } else if placement == bottom {
      (
        data.projets.data.page.margin.top + std.page.bleed,
        0pt,
      )
    }
  } else if marge == "main" {
    if placement == top {
      (
        0pt,
        0pt,
      )
    } else if placement == bottom {
      (
        0pt,
        0pt,
      )
    }
  } else if marge == "second" {
    if placement == top {
      (
        data.main-marge.get().even.top - data.second-marge.get().even.top,
        -(data.main-marge.get().even.top - data.second-marge.get().even.top),
      )
    } else if placement == bottom {
      (
        data.main-marge.get().even.top - data.second-marge.get().even.top,
        0pt,
      )
    }
  }
}

#let get_h2(height, marge: "main", full-page: false, placement: bottom) = {
  if type(height) == ratio {
    let text-height = height * get_text_height()
    if full-page {
      if marge == "main" {
        (text-height, text-height)
      } else if marge == "second" {
        (
          text-height,
          (
            text-height
              + (page.margin.top - data.second-marge.get().even.top)
              + (page.margin.bottom - data.second-marge.get().even.bottom)
          ),
        )
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
          (text-height, text-height + (page.margin.top - data.second-marge.get().even.top))
        } else if placement == bottom {
          (text-height, text-height + (page.margin.top - data.second-marge.get().even.bottom))
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
    (height, height)
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


