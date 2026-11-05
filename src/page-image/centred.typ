
#import "/src/utils.typ"
#import "/src/data.typ"
#import "@preview/meander:0.4.4"

// Créer un image parfaitemen centré entre les deux page.
#let centred(page:0,height:50%, marge:"none", full-page : false, placement: bottom, content) = {
    if full-page{
        height = 100%
        placement= top
    }

  let odd-image() = {
     let (y_margin, y_shift) = utils.get_y_shift_marge(marge: marge, placement: placement)
      let (x_margin, bleed, sum-side-marge) = utils.get_x_marges_and_shift(marge:marge)
      let (h1,h2) = utils.get_h2(height, full-page : full-page,marge : marge)
      meander.placed(
          left + placement,
          dx: -50%,
          boundary: meander.contour.margin(3mm)
      )[
        #box(
          height: h1,
          width:std.page.width -std.page.margin.right -std.page.margin.left,
          place(dx: 0pt, dy: y_shift, align(
            right,
            box(stroke: 0pt, width:std.page.width, height: h2 , align(center + horizon, content)),
          )),
        )
      ]
  }
    let even-image() = {
         let (y_margin, y_shift) = utils.get_y_shift_marge(marge: marge, placement: placement)
      let (x_margin, bleed, sum-side-marge) = utils.get_x_marges_and_shift(marge:marge)
        let (h1,h2) = utils.get_h2(height, full-page : full-page,marge : marge)
        meander.placed(
          right + placement,
          dx: 50%,
          boundary:
          meander.contour.margin(3mm)
      )[
        #box(
          height: h1,
          width:std.page.width -std.page.margin.right -std.page.margin.left,
          place(dx: 0pt, dy: y_shift, align(
            left,
            box(stroke: 0pt, width:std.page.width, height: h2, align(horizon + center, content)),
          )),
        )
      ]
    }

    ((type:"two-page-image", page1:page, page2:page+1, odd-image:odd-image, even-image:even-image,layout: none,),)
}
