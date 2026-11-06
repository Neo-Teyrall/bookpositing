#import "/src/utils.typ" 
#import "/src/data.typ"
#import "/src/layout.typ":*

#let left-1-3(page: 0, marge: "main", content) = {
    let height = 100%
    let placement = top

    let get_w() = (
        std.page.width / 2 + utils.get_inside()*2
    )

    let odd-image() = {
      let (y_margin, y_shift) = utils.get_y_shift_marge(marge: marge, placement: placement)
      let (h1, h2) = utils.get_h2(height, marge: marge, full-page: true, placement: placement)
      let w = get_w()
      meander.placed(
        left + placement,
        dx: -76%,
        boundary: meander.contour.margin(3mm),
      )[
        #box(width: w, height: h1, place(dy: y_shift, box(
          width: w,
          height: h2,
          align(center + horizon, content),
        )))
      ]
    }

    let even-image() = {
      let (y_margin, y_shift) = utils.get_y_shift_marge(marge: marge, placement: placement)
      let (h1, h2) = utils.get_h2(height, marge: marge, full-page: true, placement: placement)
      let w = get_w()
      meander.placed(
        left + placement,
          dx: 50%,
        boundary: meander.contour.margin(3mm),
      )[
        
        #box(width: w, height: h1, place(dy: y_shift, box(
          width: w,
          height: h2,
          align(center + horizon, content),
        )))
      ]
    }
    (
      (
        type: "two-page-image",
        page1: page,
        page2: page + 1,
        odd-image: odd-image,
        even-image: even-image,
        layout: (
          name: "1/3",
          layout: layout-1-3,
        ),
      ),
    )
}
