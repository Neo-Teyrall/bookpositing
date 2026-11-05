

#import "/src/utils.typ": get_h, get_h2
#import "/src/data.typ"
#import "@preview/meander:0.4.4"

// Créer un image centré qui s’étend sur les 3/4 des deux pages et qui occupe
// plus la page de gauche.
#let left-3-4(
    page:0,
    height:50%,
    marge:"main",
    full-page:false,
    placement: bottom,
    content) = {

    
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
        let (h1,h2) = get_h2(height, marge:marge,full-page: full-page)
          let (y_margin, y_shift, x_margin, bleed, sum-side-marge) = marges_and_shift()
            let w = (
       data.projets.data.page.width
        -data.projets.data.page.margin.left
        +data.projets.data.page.width / 2
        + x_margin
    )

        meander.placed(
          right + placement,
          dx: -50%,
          boundary: meander.contour.margin(1mm)
        )[
          #box(
            height: h1,
            width:data.projets.data.page.width,
            place(
              dx: - data.projets.data.page.margin.right -data.projets.data.page.margin.left,
              dy: y_shift,
              align(right)[
                #box(
                  width: w,
                  height: h2,
                  align(center + horizon, content),
                )
              ],
            ),
          )
        ]
      }

    let even-image() = {
          let (y_margin, y_shift, x_margin, bleed, sum-side-marge) = marges_and_shift()
            let w = (
       data.projets.data.page.width
        -data.projets.data.page.margin.left
        +data.projets.data.page.width / 2
        + x_margin
    )
        let (h1,h2) = get_h2(height, marge:marge,full-page: full-page)

        meander.placed(
          right + placement,
            boundary: meander.contour.margin(3mm)
        )[
          #box(
            height: h1,
            width:data.projets.data.page.width,
            place(
              dx: -x_margin,
              dy: y_shift,
              align(left)[
                #box(
                  width: w,
                  height: h2,
                  align(center + horizon, content),
                )
              ],
            ),
          )
        ]
      }

    ((type:"two-page-image", page1:page, page2:page+1, odd-image:odd-image, even-image:even-image,layout:none),)
}
