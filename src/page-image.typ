
#import "@preview/meander:0.4.4"

#import "layout.typ" : *
#import "data.typ"

#import "utils.typ" : get_h

#import "page-image/1-2.typ": full-1-2
#import "page-image/2-2.typ": full-2-2

#import "page-image/left-3-4.typ": left-3-4
#import "page-image/right-3-4.typ": right-3-4

#import "page-image/centred.typ": centred
#import "page-image/left-2-3.typ": left-2-3
#import "page-image/right-2-3.typ": right-2-3
#import "page-image/left-1-3.typ": left-1-3
#import "page-image/right-1-3.typ": right-1-3





    

//// 1/4 ///////////////////////////////////////////////////////////////////////

// Créer un image centré qui s’étend sur les 1/4 des deux pages soit 1/2 de la page.
#let i1-4(
    page: 0,
    height:100%,
    placement:top,
    even:true,
    over-marge: false,
    full-page:false,
    content) = {
    if full-page{
        over-marge = true
        height = 100%
        placement = top
    }
    let h = get_h(height, over-marge: over-marge, full-page: full-page)

  let (y_margin, shift, x_margin) = if over-marge {
    if placement == bottom {
      (data.projets.data.page.margin.bottom, - data.projets.data.page.margin.top,data.projets.data.page.margin.right - data.side-marge)
    } else if placement == top {
      (data.projets.data.page.margin.top, - data.projets.data.page.margin.top, 0pt)
    }
  } else {
    if placement == bottom {
      ( - data.emarge-soft.bottom, 0pt, data.emarge-soft.right)
    } else if placement == top {
      ( - data.emarge-soft.top,  - data.emarge-soft.top, data.emarge-soft.right)
    } else {
      (0pt, 0pt, 0pt)
    }
  }

    let w = ((data.projets.data.page.width - data.side-marge)/ 2 ) - data.side-marge
    
  let picture() = {
      if even {
            meander.placed(
          left + placement,
            dx: - data.projets.data.page.margin.right + data.side-marge,
                boundary: meander.contour.margin(5mm),

        )[
          #box(
            height: h + y_margin,
            width: w,
            place(
              dx: 0pt,
              dy:   shift,
            align(left)[
                #box(
                    width: w,
                    height: h,
                    clip: true,
                    align(center + horizon, content),
                )
            ],
            ),
          )
        ]
      }else{
            meander.placed(
          right + placement,
            dx: data.projets.data.page.margin.right - data.side-marge,
                boundary: meander.contour.margin(3mm)
        )[
          #box(
            height: h + y_margin,
            width: w,
            place(
              dx: 0pt,
              dy: shift,
            align(left)[
                #box(
                    width: w,
                    height: h,
                    clip: true,
                    align(center + horizon, content),
                )
            ],
            ),
          )
        ]
      }
  }
    ((type: "one-page-image", page: page,content: picture, layout:none),)
}
