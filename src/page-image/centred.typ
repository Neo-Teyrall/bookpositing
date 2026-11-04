
#import "/src/utils.typ": get_h, get_h2
#import "/src/data.typ"
#import "@preview/meander:0.4.4"

// Créer un image parfaitemen centré entre les deux page.
#let centred(page:0,height:50%, marge:"none", full-page : false, placement: bottom, content) = {
    if full-page{
        height = 100%
        placement= top
    }


    let marges_and_shift() = if marge == "none" {
      if placement == top {
        ( 
          data.projets.data.page.margin.top + std.page.bleed,
          -(data.projets.data.page.margin.top + std.page.bleed),
          data.main-marge.get().odd.right + std.page.bleed,
          std.page.bleed,
          0pt,
        )
      } else if placement == bottom {
        (
          data.projets.data.page.margin.top + std.page.bleed,
          0pt,
          data.main-marge.get().odd.right + std.page.bleed,
          std.page.bleed,
          0pt,
        )
      }
    } else if marge == "main" {
      if placement == top {
        //(0pt, 0pt, data.main-marge.get().odd.right*2, data.get-main-side-marge().sum())
        (
          0pt,
          0pt,
          0pt,
          0pt,
          data.get-main-side-marge().sum(),
        )
      } else if placement == bottom {
        (
          0pt,
          0pt,
          0pt, //data.main-marge.get().odd.right,
          0pt,
          data.get-main-side-marge().sum(),
        )
      }
    } else if marge == "second" {
      if placement == top {
        (
          data.main-marge.get().even.top - data.second-marge.get().even.top,
          -(data.main-marge.get().even.top - data.second-marge.get().even.top),
          data.second-marge.get().odd.right,
          0pt,
          data.get-second-side-marge().sum(),
        )
      } else if placement == bottom {
        (
          data.main-marge.get().even.top - data.second-marge.get().even.top,
          0pt,
          data.second-marge.get().odd.right,
          0pt,
          data.get-second-side-marge().sum(),
        )
      }
    }

  let odd-image() = {
      let (y_margin, y_shift, x_margin, bleed, sum-side-marge) = marges_and_shift()
      let (h1,h2) = get_h2(height, full-page : full-page,marge : marge)
      meander.placed(
          left + placement,
          dx: -50%,
          boundary: meander.contour.margin(3mm)
      )[
        #box(
          height: h1,
          width:data.projets.data.page.width -data.projets.data.page.margin.right -data.projets.data.page.margin.left,
          place(dx: 0pt, dy: y_shift, align(
            right,
            box(stroke: 0pt, width:data.projets.data.page.width, height: h2 , align(center + horizon, content)),
          )),
        )
      ]
  }
    let even-image() = {
        let (y_margin, y_shift, x_margin, bleed, sum-side-marge) = marges_and_shift()
        let (h1,h2) = get_h2(height, full-page : full-page,marge : marge)
        meander.placed(
          right + placement,
          dx: 50%,
          boundary:
          meander.contour.margin(3mm)
      )[
        #box(
          height: h1,
          width:data.projets.data.page.width -data.projets.data.page.margin.right -data.projets.data.page.margin.left,
          place(dx: 0pt, dy: y_shift, align(
            left,
            box(stroke: 0pt, width:data.projets.data.page.width, height: h2, align(horizon + center, content)),
          )),
        )
      ]
    }

    ((type:"two-page-image", page1:page, page2:page+1, odd-image:odd-image, even-image:even-image,layout: none,),)
}
