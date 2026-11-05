
#import "data.typ"

#let get_text_width() = {
  let margin = 0
  if not page.margin.keys().contains("left") and not page.margin.keys().contains("right") {
    margin = 5cm
  } else if page.margin.keys().contains("left") and not page.margin.keys().contains("right") {
    margin = page.margin.left + 2.5cm
  } else if not page.margin.keys().contains("left") and page.margin.keys().contains("right") {
    margin = page.margin.right + 2.5cm
  } else if page.margin.keys().contains("left") and page.margin.keys().contains("right") {
    margin = page.margin.left + page.margin.right
  } else if page.margin.keys().contains("outside") and page.margin.keys().contains("inside") {
    margin = page.margin.inside + page.margin.outside
  } else if not page.margin.keys().contains("outside") and page.margin.keys().contains("inside") {
    margin = page.margin.inside + 2.5cm
  } else if page.margin.keys().contains("outside") and not page.margin.keys().contains("inside") {
    margin = page.margin.outside + 2.5cm
  }
  page.width - margin
}

#let get_text_height() = {
    page.height - page.margin.top - page.margin.bottom
}


#let get_x_marges_and_shift(marge:"main") = {
  if marge == "none" {
    (
        std.page.margin.right + std.page.bleed,
      std.page.bleed,
      0pt,
    )
  } else if marge == "main" {
    (
      0pt,
      0pt,
      data.get-main-side-marge().sum(),
    )
  } else if marge == "second" {
      (
          data.get_outside() - data.second-marge.get().outside,
        0pt,
          data.get-second-side-marge().sum(),
      )
  }
}

#let get_y_shift_marge(marge: "main", placement: top) = {
  if marge == "none" {
    if placement == top {
      (
          std.page.margin.top + std.page.bleed,
          -(std.page.margin.top + std.page.bleed),
      )
    } else if placement == bottom {
      (
          std.page.margin.top + std.page.bleed,
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
        page.margin.top - data.second-marge.get().top,
        -(page.margin.top - data.second-marge.get().top),
      )
    } else if placement == bottom {
      (
        page.margin.top - data.second-marge.get().top,
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
              + (page.margin.top - data.second-marge.get().top)
              + (page.margin.bottom - data.second-marge.get().bottom)
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
          (text-height, text-height + (page.margin.top - data.second-marge.get().top))
        } else if placement == bottom {
          (text-height, text-height + (page.margin.top - data.second-marge.get().bottom))
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


