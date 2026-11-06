
#import "data.typ"



#let get_bleed_top() = {
  if page.bleed == (:) {
    0cm
  } else if type(page.bleed) == relative {
    page.bleed
  } else if type(page.bleed) == measure {
    page.bleed
  } else if type(page.bleed) == dictionary {
    if page.bleed.keys().contains("top") {
      page.bleed.top
    } else if page.bleed.keys().contains("y") {
      page.bleed.y
    } else if page.bleed.keys().contains("rest") {
      page.bleed.rest
    }
  }
}

#let get_bleed_bottom() = {
  if page.bleed == (:) {
    return 0cm
  } else if type(page.bleed) == relative {
    page.bleed
  } else if type(page.bleed) == length {
    return page.bleed
  } else if type(page.bleed) == dictionary {
    if page.bleed.keys().contains("bottom") {
      return page.bleed.bottom
    } else if page.bleed.keys().contains("y") {
      return page.bleed.y
    } else if page.bleed.keys().contains("rest") {
      return page.bleed.rest
    }
  }
}


#let get_bleed_inside() = {
  if page.bleed == (:) {
    return 0cm
  } else if type(page.bleed) == relative {
    page.bleed
  } else if type(page.bleed) == measure {
    return page.bleed
  } else if type(page.bleed) == dictionary {
    if page.bleed.keys().contains("inside") {
      return page.bleed.inside
    } else if page.bleed.keys().contains("x") {
      return page.bleed.x
    } else if page.bleed.keys().contains("rest") {
      return page.bleed.rest
    }
  }
}


#let get_bleed_outside() = {
  if page.bleed == (:) {
    0cm
  } else if type(page.bleed) == relative {
    page.bleed
  } else if type(page.bleed) == measure {
    page.bleed
  } else if type(page.bleed) == dictionary {
    if page.bleed.keys().contains("outside") {
      page.bleed.outside
    } else if page.bleed.keys().contains("x") {
      page.bleed.x
    } else if page.bleed.keys().contains("rest") {
      page.bleed.rest
    }
  }
}

#let get_top() = {
  if page.margin == auto {
    return 2.5cm
  } else if type(page.margin) == relative {
    page.margin
  } else if page.margin.keys().contains("top") {
    return page.margin.top
  } else if page.margin.keys().contains("y") {
    return page.margin.y
  } else if page.margin.keys().contains("rest") {
    return page.margin.rest
  }
}


#let get_bottom() = {
  if page.margin == auto {
    2.5cm
  } else if type(page.margin) == relative {
    page.margin
  } else if page.margin.keys().contains("bottom") {
    page.margin.top
  } else if page.margin.keys().contains("y") {
    page.margin.y
  } else if page.margin.keys().contains("rest") {
    page.margin.rest
  }
}



#let get_outside() = {
  if page.margin == auto {
    2.5cm
  } else if type(page.margin) != dictionary {
    page.margin
  } else if type(page.margin) == relative {
    page.margin
  } else if page.margin.keys().contains("outside") {
    page.margin.outside
  } else if page.margin.keys().contains("x") {
    page.margin.x
  } else if page.margin.keys().contains("right") and page.margin.keys().contains("left") {
    if page.margin.right == page.margin.left {
      page.margin.right
    } else {
      panic(
        "Bookpositing::get_outisde() -> impossible de déterminer la valeur outside pensé a définir le parametre \"page.margin.outside\" ou que les page.margin.right et page.margin.left soit egaux:
           https://typst.app/docs/reference/layout/page/#parameters-margin ",
      )
    }
  }
}

#let get_inside() = {
  if page.margin == auto {
    2.5cm
  } else if type(page.margin) != dictionary {
    page.margin
  } else if type(page.margin) == relative {
    page.margin
  } else if page.margin.keys().contains("inside") {
    page.margin.inside
  } else if page.margin.keys().contains("x") {
    page.margin.x
  } else if page.margin.keys().contains("right") and page.margin.keys().contains("left") {
    if page.margin.right == page.margin.left {
      page.margin.right
    } else {
      panic(
        "Bookpositing::get_outisde() -> impossible de déterminer la valeur inside pensé a définir le parametre \"page.margin.inside\" ou que les page.margin.right et page.margin.left soit egaux
https://typst.app/docs/reference/layout/page/#parameters-margin
",
      )
    }
  }
}



#let get-main-side-marge() = {
    if page.margin == auto {
        (2.5cm,2.5cm)
    }else {
        (get_outside(), get_outside())
    }
}

#let get-second-side-marge() = {
    (data.second-marge.get().outside, data.second-marge.get().outside)
}


#let get_text_width() = {
  page.width - get_inside() - get_outside()
}

#let get_text_height() = {
  let margin = 0
    page.height - get_top() - get_bottom()
}


#let get_x_marges_and_shift(marge:"main") = {
  if marge == "none" {
    (
         get_outside() + get_bleed_outside(),
      std.page.bleed,
      0pt,
    )
  } else if marge == "main" {
    (
      0pt,
      0pt,
      get-main-side-marge().sum(),
    )
  } else if marge == "second" {
      (
          get_outside() - data.second-marge.get().outside,
        0pt,
          get-second-side-marge().sum(),
      )
  }
} 

#let get_y_shift_marge(marge: "main", placement: top) = {
  if marge == "none" {
    if placement == top {
      (
          get_top() + get_bleed_top(),
          -(get_top() + get_bleed_top()),
      )
    } else if placement == bottom {
      (
          get_bottom() + get_bleed_bottom(),
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
          get_top() - data.second-marge.get().top,
          -(get_top() - data.second-marge.get().top),
      )
    } else if placement == bottom {
      (
          get_bottom() - data.second-marge.get().bottom,
        0pt,
      )
    }
  } else {
      panic("Bookpositing: Error type de marge " + marge + "inconue")
  }

}

#let get_h(height, marge: "main", full-page: false, placement: bottom) = {
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
            + (get_top() - data.second-marge.get().top)
            + (get_bottom() - data.second-marge.get().bottom)
          ),
        )
      } else if marge == "none" {
          (text-height, text-height + get_top() + get_bottom() + (page.bleed * 2))
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
            (text-height, text-height + (get_top() - data.second-marge.get().top))
        } else if placement == bottom {
            (text-height, text-height + (get_bottom() - data.second-marge.get().bottom))
        }
      } else if marge == "none" {
        if placement == top {
          (text-height, text-height + get_top() + get_bleed_top())
        } else if placement == bottom {
          (text-height, text-height + get_bottom() + get_bleed_bottom())
         }
      }
    }
  } else {
    // version temporaire
    (height, height)
  }
}


#let get_page_layout() = {
    (height: (
        get_text_height()
    ),
    width: (
        get_text_width()
    ),)
}
